using namespace System.Collections
using namespace System.IO

class LogMessage {
    [DateTime] $TimeStamp
    [string] $Message
    [LogLevel] $Level
    [ScriptLogInfo] $ScriptLogInfo

    [string] ToString() {
        return $this.Message
    }
}
