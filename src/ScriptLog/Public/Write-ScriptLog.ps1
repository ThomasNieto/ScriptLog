function Write-ScriptLog {
    [CmdletBinding()]
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

        [Parameter()]
        [Encoding]
        $Encoding = [Encoding]::Default,

        [Parameter()]
        [switch]
        $PassThru
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}