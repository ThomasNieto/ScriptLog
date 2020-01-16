using namespace System.Collections
using namespace System.IO

class ScriptLogInfo {
    [FileInfo] $Path
    [string] $ScriptName
    [string] $ScriptVersion
    [FileInfo] $ScriptPath
    [string] $UserName
    [string] $ComputerName
    [DateTime] $StartTime
    [DateTime] $EndTime
    [int] $ProcessId
    [IDictionary] $PSEnvironment = @{ }
    [IDictionary] $BoundParameters = @{ }

    ScriptLogInfo() { }

    ScriptLogInfo([bool] $currentEnvironment, [bool] $currentTime) {
        if ($currentEnvironment) {
            $this.UserName = '{0}\{1}' -f [Environment]::UserDomainName, [Environment]::UserName
            $this.ComputerName = [Environment]::MachineName
            $this.ProcessId = $global:PID
            $this.PSEnvironment = $global:PSVersionTable
            $this.PSEnvironment['Host'] = $global:Host.Name
        }

        if ($currentTime) {
            $this.StartTime = Get-Date
        }
    }
}
