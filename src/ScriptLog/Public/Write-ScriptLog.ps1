function Write-ScriptLog {
    [CmdletBinding(
        DefaultParameterSetName = 'Path',
        HelpUri = 'https://link.tnieto88.dev/Write-ScriptLog'
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
        
        switch ($PSCmdlet.ParameterSetName) {
            'Path' {
                $logFilePath = $Path
            }

            'ScriptLogInfo' {
                $logFilePath = $ScriptLogInfo.Path
            }
        }

        $logString = "[{0}] {1,-13} {2}" -f $dateTime.ToString($script:DATETIMEFORMAT), $logLevel, $Message
        Add-Content -Value $logString -Path $logFilePath
        
        if ($PassThru) {
            $logMessage = [LogMessage]::New()
            $logMessage.TimeStamp = $dateTime
            $logMessage.Message = $Message
            $logMessage.Level = $Level
            
            #TODO: Fix invovation
            <#
            if ($ScriptLogInfo) {
                $logMessage.Invocation = $ScriptLogInfo
            }
            else {
                $logInfo = [ScriptLogInfo]::New()
                $logInfo.Path = $Path
                $logMessage.Invocation = $logInfo
            }
            #>

            Write-Output -InputObject $logMessage
        }
    }
    
    end {
        
    }
}
