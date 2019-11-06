using namespace System.Collections
#using module ScriptLog

class LogMessage {
    [datetime]$TimeStamp
    [string]$Message
    [LogLevel]$Level
    [IDictionary]$Invocation

    [string] ToString() {
        return $this.Message
    }
}
