function Stop-ScriptLog {
    [CmdletBinding(
        DefaultParameterSetName = 'Path',
        SupportsShouldProcess,
        ConfirmImpact = 'Low',
        HelpUri = 'https://go.thomasnieto.com/Stop-ScriptLog'
    )]
    [OutputType([LogMessage])]
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
        [ScriptLogInfo]
        $ScriptLogInfo,

        [Parameter()]
        [switch]
        $PassThru
    )
    
    if ($PSBoundParameters['ScriptLogInfo']) {
        $Path = $ScriptLogInfo.Path
    }
    else {
        $ScriptLogInfo = [ScriptLogInfo]::New($true, $false)
        $ScriptLogInfo.Path = $Path
    }

    if (Test-Path -Path $Path) {
        if ($PSCmdlet.ShouldProcess($Path)) {
            $endTime = Get-Date
            
            $footer = @()
            $footer += Get-Padding -String $LocalizedData.ScriptLogEndFooter
            $footer += 'EndTime = {0}' -f $endTime.ToString($script:DATETIMEFORMAT)
            $footer += $LocalizedData.DividerCharacter * $LocalizedData.DividerLength
            Add-Content -Value $footer -Path $Path

            if ($PassThru) {
                if ($PSBoundParameters['ScriptLogInfo']) {
                    $ScriptLogInfo.EndTime += $endTime
                    Write-Output -InputObject $ScriptLogInfo
                }
                else {
                    Write-Output -InputObject $ScriptLogInfo
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
