using namespace System.Collections
using namespace System.IO

class LogMessage {
    [datetime]$TimeStamp
    [string]$Message
    [LogLevel]$Level
    [FileInfo]$Path
    [string]$ScriptName
    [string]$ScriptVersion
    [FileInfo]$ScriptPath
    [string]$UserName
    [string]$ComputerName
    [datetime]$StartTime
    [datetime]$EndTime
    [int]$ProcessId
    [IDictionary]$PSEnvironment
    [IDictionary]$BoundParameters

    [string] ToString() {
        return $this.Message
    }
}
