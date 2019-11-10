function Start-ScriptLog {
    [CmdletBinding(DefaultParameterSetName = 'Path')]
    [OutputType([PSObject])]
    param (
        [Parameter(
            ParameterSetName = 'Path',
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $Path,

        [Parameter(
            ParameterSetName = 'OutputDirectory',
            Position = 0
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $OutputDirectory,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [PSObject]
        $ScriptInfo,

        [Parameter()]
        [System.Collections.IDictionary]
        $BoundParameters,

        [Parameter()]
        [switch]
        $NoEnvironmentInfo,

        [Parameter()]
        [switch]
        $NoClobber,

        [Parameter()]
        [switch]
        $Append,

        [Parameter()]
        [switch]
        $PassThru
    )

    if (-not $PSBoundParameters['Path']) {
        # A random string is used to match Start-Transcript default file name
        $randomBytes = New-Object -TypeName Byte[] -ArgumentList 6
        [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($randomBytes)
        $randomString = [convert]::ToBase64String($randomBytes) -replace '/', '_'

        if ($PSBoundParameters['ScriptInfo']) {
            $fileName = $LocalizedData.DefaultScriptFullName -f $ScriptInfo.Name, [Environment]::MachineName, $randomString, (Get-Date)
        }
        else {
            $fileName = $LocalizedData.DefaultScriptFullName -f $LocalizedData.DefaultScriptName, [Environment]::MachineName, $randomString, (Get-Date)
        }

        if ($PSBoundParameters['OutputDirectory']) {
            $Path = Join-Path -Path $OutputDirectory -ChildPath $fileName
        }
        else {
            $Path = Join-Path -Path ([Environment]::GetFolderPath('MyDocuments')) -ChildPath $fileName
        }
    }
    
    if ($NoClobber -and -not $Append -and (Test-Path -Path $Path)) {
        $paramWriteError = @{
            Message      = ($LocalizedData.FileExistsNoClobber -f $Path)
            Category     = 'ResourceExists'
            TargetObject = $Path
        }
        
        Write-Error @paramWriteError
    }

    $header = @()
    $header += Get-Padding -String $LocalizedData.ScriptLogStartHeader
    
    $invocation = @{ }
    $invocation['StartTime'] = Get-Date
    $invocation['UserName'] = '{0}\{1}' -f [Environment]::UserDomainName, [Environment]::UserName
    $invocation['Machine'] = [Environment]::MachineName
    $invocation['ProcessId'] = $PID
    
    foreach ($item in $invocation.GetEnumerator()) {
        if ($item.Key -eq 'StartTime' -or $item.Key -eq 'EndTime') {
            $value = $item.Value.ToString($script:DATETIMEFORMAT)
        }
        else {
            $value = $item.Value
        }

        $header += '{0} = {1}' -f $item.Key, $Value
    }

    $invocation['Host'] += $Host.Name
    $invocation += $PSVersionTable

    if (-not $NoEnvironmentInfo) {
        $header += Get-Padding -String $LocalizedData.EnvironmentHeader
        $header += '{0} = {1}' -f 'Host', $Host.Name
        
        foreach ($item in $PSVersionTable.GetEnumerator()) {
            $header += '{0} = {1}' -f $item.Key, ($item.Value -join ', ')
        }
    }

    if ($PSBoundParameters['ScriptInfo'] -or $PSBoundParameters['BoundParameters']) {
        $header += Get-Padding -String $LocalizedData.ScriptInvocationHeader
    }

    if ($PSBoundParameters['ScriptInfo']) {
        $invocation['ScriptName'] = $ScriptInfo.Name
        $invocation['ScriptVersion'] = $ScriptInfo.Version
        $invocation['ScriptPath'] = $ScriptInfo.Path
        
        $header += 'ScriptName = {0}' -f $ScriptName
        $header += 'ScriptVersion = {0}' -f $ScriptVersion
        $header += 'ScriptPath = {0}' -f $ScriptPath
    }

    if ($PSBoundParameters['BoundParameters']) {
        foreach ($item in $BoundParameters.GetEnumerator()) {
            $key = 'ScriptParameter_{0}' -f $item.Key
            $invocation[$key] = $item.Value

            $header += '{0} = {1}' -f $key, $item.Value
        }
    }

    $header += $LocalizedData.DividerCharacter * $LocalizedData.DividerLength

    if ($Append) {
        Add-Content -Value $header -Path $Path
    }
    else {
        Set-Content -Value $header -Path $Path
    }

    if ($PassThru) {
        $output = [ScriptLogInfo]@{
            Path       = $Path
            Invocation = $invocation
        }

        Write-Output -InputObject $output
    }
}
