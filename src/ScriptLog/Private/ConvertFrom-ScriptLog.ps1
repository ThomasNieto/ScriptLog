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
    
    $invocation = @{ }
    $messageCache = @()
    $dividerRegex = '^{0}' -f $LocalizedData.DividerCharacter
        
    foreach ($line in $String) {
        if ($line -match '^\w+ = ') {
            if ($line -match '^(?<Property>\w+) = (?<Value>.+)$') {
                $scriptProperty = @{ $Matches.Property = $Matches.Value }
            }
            elseif ($line -match '^(?<Property>\w+) = $') {
                $scriptProperty = @{ $Matches.Property = $null }
            }

            if ($scriptProperty['StartTime']) {
                if ($messageCache) {
                    $logMessage.Invocation = $invocation
                    $logMessage.Message = $messageCache -join [Environment]::NewLine
                    Write-Output -InputObject $logMessage
                    $messageCache = @()
                }

                $invocation = @{ }
                $invocation += $scriptProperty
            }
            elseif ($scriptProperty['EndTime']) {
                $invocation += $scriptProperty
                    
                if ($messageCache) {
                    $logMessage.Invocation = $invocation
                    $logMessage.Message = $messageCache -join [Environment]::NewLine
                    Write-Output -InputObject $logMessage
                    $messageCache = @()
                }
            }
            else {
                $invocation += $scriptProperty
            }
        }
        elseif ($line -match '\[(?<TimeStamp>.+)\] \[(?<Level>.+)\]\s+(?<Message>.+)') {
            if ($messageCache) {
                $logMessage.Invocation = $invocation
                $logMessage.Message = $messageCache -join [Environment]::NewLine
                Write-Output -InputObject $logMessage
                $messageCache = @()
            }

            $logMessage = [LogMessage]@{
                TimeStamp = $Matches.TimeStamp
                Level     = $Matches.Level
            }

            $messageCache += $Matches.Message
        }
        elseif ($messageCache -and -not ($line -match $dividerRegex)) {
            $messageCache += $line
        }
    }
}
