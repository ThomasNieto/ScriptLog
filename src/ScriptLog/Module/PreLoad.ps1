Set-StrictMode -Version 2

Import-LocalizedData -BindingVariable LocalizedData -FileName ScriptLog.Resources.psd1

New-Variable -Name DateTimeFormat -Value 'o' -Option Constant -Scope Script
