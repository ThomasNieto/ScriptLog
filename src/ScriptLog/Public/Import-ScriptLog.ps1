function Import-ScriptLog {
    [CmdletBinding(
        DefaultParameterSetName = 'Path',
        HelpUri = 'https://link.tnieto88.dev/Import-ScriptLog'
    )]
    #[OutputType([LogMessage])]
    param (
        [Parameter(
            ParameterSetName = 'Path',
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string[]]
        $Path,

        [Parameter(
            ParameterSetName = 'ScriptLogInfo',
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [ScriptLogInfo]
        $ScriptLogInfo
    )
    
    process {
        $content = Get-Content -Path $Path
        ConvertFrom-ScriptLog -String $content |
        Write-Output
    }
}
