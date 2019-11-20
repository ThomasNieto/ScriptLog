function Write-ScriptLog {
    [CmdletBinding(
        DefaultParameterSetName = 'Path',
        HelpUri = 'https://go.thomasnieto.com/Write-ScriptLog'
    )]
    [OutputType([LogMessage])]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Message,

        [Parameter()]
        [LogLevel]
        $Level = [LogLevel]::Information,

        [Parameter(
            Mandatory,
            ParameterSetName = 'Path'
        )]
        [string]
        $Path,

        [Parameter(
            Mandatory,
            ParameterSetName = 'ScriptLogInfo'
        )]
        [ScriptLogInfo]
        $ScriptLogInfo,

        [Parameter()]
        [switch]
        $PassThru
    )
    
    begin {
        if (-not $PSBoundParameters['ScriptLogInfo']) {
            $ScriptLogInfo = [ScriptLogInfo]($true, $false)
        }
    }
    
    process {
        $dateTime = Get-Date
        $logLevel = "[{0}]" -f $Level
        
        if ($PSBoundParameters['ScriptLogInfo']) {
            $Path = $ScriptLogInfo.Path
        }

        $logString = "[{0}] {1,-13} {2}" -f $dateTime.ToString($script:DATETIMEFORMAT), $logLevel, $Message
        Add-Content -Value $logString -Path $Path
        
        if ($PassThru) {
            $logMessage = [LogMessage]@{
                TimeStamp     = $dateTime
                Message       = $Message
                Level         = $Level
                ScriptLogInfo = $ScriptLogInfo
            }
            
            Write-Output -InputObject $logMessage
        }
    }
}
