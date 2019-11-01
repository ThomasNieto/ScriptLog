using namespace System.Collections
using namespace System.IO

Set-StrictMode -Version 2

Import-LocalizedData -BindingVariable LocalizedData -FileName ScriptLog.Resources.psd1

$script:DATETIMEFORMAT = 'yyyy-MM-dd HH:mm:sszzz'
