function Start-ScriptLog {
    [CmdletBinding(DefaultParameterSetName = 'Path')]
    [OutputType([PSObject])]
    param (
        [Parameter(
            ParameterSetName = 'Path',
            Mandatory,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path,

        [Parameter(
            ParameterSetName = 'ScriptInfo',
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [PSObject]
        $ScriptInfo,

        [Parameter(
            ParameterSetName = 'Path'
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $ScriptName,

        [Parameter(
            ParameterSetName = 'Path'
        )]
        [version]
        $ScriptVersion,

        [Parameter()]
        [System.Collections.IDictionary]
        $ArgumentList,

        [Parameter()]
        [switch]
        $NoEnvironmentInfo,

        [Parameter(
            ParameterSetName = 'ScriptInfo'
        )]
        [switch]
        $NoScriptInfo,

        [Parameter()]
        [switch]
        $NoClobber,

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