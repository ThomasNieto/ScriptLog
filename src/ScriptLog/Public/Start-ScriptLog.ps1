function Start-ScriptLog {
    [CmdletBinding(DefaultParameterSetName = 'Path')]
    [OutputType([PSObject])]
    param (
        [Parameter(
            Mandatory,
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path,

        [Parameter(
            ParameterSetName = 'ScriptInfo',
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

        [Parameter(
            ParameterSetName = 'Path'
        )]
        [string]
        $ScriptPath,

        [Parameter()]
        [System.Collections.IDictionary]
        $BoundParameters,

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
        [int]
        $Retention,

        [Parameter()]
        [long]
        $MaximumFileSize,

        [Parameter()]
        [switch]
        $PassThru
    )
    
    if ($NoClobber -and (Test-Path -Path $Path)) {
        $paramWriteError = @{
            Message      = $LocalizedData.FileExistsNoClobber
            Category     = 'ResourceExists'
            TargetObject = $Path
        }
        
        Write-Error @paramWriteError
    }

    $header = @()
    $header += Get-Padding -String $LocalizedData.ScriptLogStartHeader -PaddingCharacter $LocalizedData.DividerCharaceter
    
    $invocation = @{}
    $invocation['StartTime'] = Get-Date
    $invocation['UserName'] = '{0}\{1}' -f [Environment]::UserDomainName, [Environment]::UserName
    $invocation['Machine'] = [Environment]::MachineName
    $invocation['ProcessId'] = $PID

    foreach ($item in $invocation.GetEnumerator()) {
        $header += '{0} = {1}' -f $item.Key, $item.Value
    }

    if (-not $NoEnvironmentInfo) {
        $header += Get-Padding -String $LocalizedData.EnvironmentHeader
        
        foreach ($item in $PSVersionTable.GetEnumerator()) {
            #TODO: Fix array values
            $header += '{0} = {1}' -f $item.Key, $item.Value
        }
    }

    if ($PSCmdlet.ParameterSetName -eq 'ScriptInfo' -and -not $NoScriptInfo -or $ScriptName -or $ScriptVersion -or $ScriptPath) {
        $header += Get-Padding -String $LocalizedData.ScriptInvocationHeader
    }

    if ($PSCmdlet.ParameterSetName -eq 'ScriptInfo') {
        $invocation['ScriptName'] = $ScriptInfo.Name
        $invocation['ScriptVersion'] = $ScriptInfo.Version
        $invocation['ScriptPath'] = $ScriptInfo.Path

        $header += 'ScriptName = {0}' -f $ScriptInfo.Name
        $header += 'ScriptVersion = {0}' -f $ScriptInfo.Version
        $header += 'ScriptPath = {0}' -f $ScriptInfo.Path
    }

    if ($BoundParameters) {
        foreach ($item in $BoundParameters.GetEnumerator()) {
            $key = 'ScriptParameter_{0}' -f $item.Key
            $invocation[$key] = $item.Value

            $header += '{0} = {1}' -f $key, $item.Value
        }
    }

    $header += $LocalizedData.DividerCharaceter * $LocalizedData.DividerLength

    Add-Content -Value $header -Path $Path

    $invocation += $PSVersionTable

    if ($PassThru) {
        $output = [ScriptLogInfo]@{
            Path            = $Path
            Retention       = $Retention
            MaximumFileSize = $MaximumFileSize
            Invocation      = $invocation
        }

        Write-Output -InputObject $output
    }
}
