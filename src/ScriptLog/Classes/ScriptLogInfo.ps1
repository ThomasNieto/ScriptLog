using namespace System.IO

class ScriptLogInfo {
    [FileInfo]$Path
    [int]$Retention
    [long]$MaxFileSize
}
