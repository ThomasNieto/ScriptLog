function Reset-ScriptLog {
    [CmdletBinding()]
    param (
        [Parameter(
            ParameterSetName = 'Path',
            Mandatory,
            Position = 0
        )]
        [string[]]
        $Path,

        [Parameter(
            ParameterSetName = 'ScriptLogInfo',
            Mandatory,
            Position = 0
        )]
        [ScriptLogInfo]
        $ScriptLogInfo,

        [Parameter(
            ParameterSetName = 'Path',
            Mandatory,
            Position = 1
        )]
        [int]
        $Retention,

        [Parameter(
            ParameterSetName = 'Path',
            Mandatory,
            Position = 2
        )]
        [long]
        $MaximumFileSize,

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
