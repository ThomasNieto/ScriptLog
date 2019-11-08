using namespace System.IO
using namespace System.Collections

class ScriptLogInfo {
    [FileInfo]$Path
    [int]$Retention
    [long]$MaximumFileSize
    [IDictionary]$Invocation
}
