function ConvertFrom-ScriptLog {
    [CmdletBinding()]
    [OutputType([PSObject])]
    param (
        [Parameter(
            Mandatory,
            Position = 0
        )]
        [string[]]
        $String
    )
    
    $messageCache = @()
    $dividerRegex = '^{0}' -f $LocalizedData.DividerCharacter
    $scriptLogInfo = [ScriptLogInfo]::New()
    $scriptLogInfoProperties = [ScriptLogInfo]::New() |
    Get-Member -MemberType Property |
    Select-Object -ExpandProperty Name

    foreach ($line in $String) {
        if ($line -match '^\w+ = ') {
            if ($line -match '^(?<Property>\w+) = (?<Value>.+)$') {
                $propertyName = $Matches.Property
                $propertyValue = $Matches.Value
            }
            elseif ($line -match '^(?<Property>\w+) = $') {
                $propertyName = $Matches.Property
                $propertyValue = $null
            }

            if ($propertyName -eq 'StartTime') {
                if ($messageCache) {
                    $logMessage.ScriptLogInfo = $scriptLogInfo
                    $logMessage.Message = $messageCache -join [Environment]::NewLine
                    Write-Output -InputObject $logMessage
                    $messageCache = @()
                    $scriptLogInfo = [ScriptLogInfo]::New()
                }

                $scriptLogInfo.StartTime = $propertyValue
            }
            elseif ($propertyName -eq 'EndTime') {
                $scriptLogInfo.EndTime = $propertyValue

                if ($messageCache) {
                    $logMessage.ScriptLogInfo = $scriptLogInfo
                    $logMessage.Message = $messageCache -join [Environment]::NewLine
                    Write-Output -InputObject $logMessage
                    $messageCache = @()
                    $scriptLogInfo = [ScriptLogInfo]::New()
                }
            }
            elseif ($propertyName -in $scriptLogInfoProperties) {
                $scriptLogInfo.$propertyName = $propertyValue
            }
            else {
                $scriptLogInfo.PSEnvironment[$propertyName] = $propertyValue
            }
        }
        elseif ($line -match '^\[(?<TimeStamp>.+)\] \[(?<Level>.+)\]\s+(?<Message>.+)') {
            if ($messageCache) {
                $logMessage.ScriptLogInfo = $scriptLogInfo
                $logMessage.Message = $messageCache -join [Environment]::NewLine
                Write-Output -InputObject $logMessage
                $messageCache = @()
            }

            $logMessage = [LogMessage]@{
                TimeStamp     = $Matches.TimeStamp
                Level         = $Matches.Level
            }

            $messageCache += $Matches.Message
        }
        elseif ($messageCache -and -not ($line -match $dividerRegex)) {
            $messageCache += $line
        }
    }

    if ($messageCache) {
        $logMessage.ScriptLogInfo = $scriptLogInfo
        $logMessage.Message = $messageCache -join [Environment]::NewLine
        Write-Output -InputObject $logMessage
    }
}
