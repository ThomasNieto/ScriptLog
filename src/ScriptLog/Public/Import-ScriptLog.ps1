function Import-ScriptLog {
    [CmdletBinding()]
    [OutputType([LogMessage])]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Path
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}
