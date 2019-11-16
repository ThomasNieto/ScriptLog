function Write-ScriptLog {
    [CmdletBinding(
        DefaultParameterSetName = 'Path',
        HelpUri = 'https://go.thomasnieto.com/Write-ScriptLog'
    )]
    #[OutputType([LogMessage])]
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
                Path          = $Path
            }

            if ($PSBoundParameters['ScriptLogInfo']) {
                $logMessage.ScriptName = $ScriptLogInfo.ScriptName
                $logMessage.ScriptVersion = $ScriptLogInfo.ScriptVersion
                $logMessage.ScriptPath = $ScriptLogInfo.ScriptPath
                $logMessage.BoundParameters = $ScriptLogInfo.BoundParameters
                $logMessage.UserName = $ScriptLogInfo.UserName
                $logMessage.ComputerName = $ScriptLogInfo.ComputerName
                $logMessage.ProcessId = $ScriptLogInfo.ProcessId
                $logMessage.PSEnvironment = $ScriptLogInfo.PSVersionTable
                $logMessage.StartTime = $ScriptLogInfo.StartTime
            }
            else {
                $logMessage.UserName = '{0}\{1}' -f [Environment]::UserDomainName, [Environment]::UserName
                $logMessage.ComputerName = [Environment]::MachineName
                $logMessage.ProcessId = $PID
                $logMessage.PSEnvironment = $PSVersionTable
            }

            $logMessage.PSEnvironment['Host'] = $Host.Name
            
            Write-Output -InputObject $logMessage
        }
    }
    
    end {
        
    }
}
