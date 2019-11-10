function Stop-ScriptLog {
    [CmdletBinding(
        DefaultParameterSetName = 'Path',
        SupportsShouldProcess,
        ConfirmImpact = 'Low'
    )]
    param (
        [Parameter(
            ParameterSetName = 'Path',
            Mandatory,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path,

        [Parameter(
            ParameterSetName = 'ScriptLogInfo',
            Mandatory,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [PSObject]
        $ScriptLogInfo,

        [Parameter()]
        [switch]
        $PassThru
    )
    
    if ($PSBoundParameters['ScriptLogInfo']) {
        $Path = $ScriptLogInfo.Path
    }

    if (Test-Path -Path $Path) {
        if ($PSCmdlet.ShouldProcess($Path)) {
            $invocation = @{ EndTime = (Get-Date) }
            
            $footer = @()
            $footer += Get-Padding -String $LocalizedData.ScriptLogEndFooter
            $footer += 'EndTime = {0}' -f $invocation['EndTime'].ToString($script:DATETIMEFORMAT)
            $footer += $LocalizedData.DividerCharacter * $LocalizedData.DividerLength
            Add-Content -Value $footer -Path $Path

            if ($PassThru) {
                if ($PSBoundParameters['ScriptLogInfo']) {
                    $ScriptLogInfo.Invocation += $invocation
                    Write-Output -InputObject $ScriptLogInfo
                }
                else {
                    $output = [ScriptLogInfo]@{
                        Path       = $Path
                        Invocation = $invocation
                    }

                    Write-Output -InputObject $output
                }
            }
        }
    }
    else {
        $paramWriteError = @{
            Message      = $LocalizedData.FileNotFound
            Category     = 'ObjectNotFound'
            TargetObject = $Path
        }

        Write-Error @paramWriteError
    }
}
