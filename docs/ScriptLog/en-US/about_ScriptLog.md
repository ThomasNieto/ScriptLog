# CWx.Script.Logging

## about_CWx.Script.Logging

## SHORT DESCRIPTION

Explains how to use CWx.Script.Logging module.

## LONG DESCRIPTION

The CWx.Script.Logging module is a collection of cmdlets to write and manage script logs.
Script log file is in a standard format allowing for Import-ScriptLog to create a PSObject for each message in the log file as well as the script invocation details.

### Script Log Format

There are three sections to a script log file: script start, messages, and script end.

The start script log invocation block which has three parts:

- Script start containing start time, computer name, and process ID (PID).
- PowerShell environment with host application and values from $PSVersionTable.
- Script information with name, version, path, and parameters.

Log message entries have the following sections:

- TimeStamp of the message in ISO date time format yyyy-MM-dd HH:mm:ss.
- Log level with values of Information, Warning, Error, and Debug.
- Message

Script end block contains only a single value of the date time when the log finished.

```powershell
--------- [PowerShell Script Log Start] ----------
StartTime = 2018-10-04 14:33:54
UserName = user1
ComputerName = pc1
ProcessID = 14792
------------ [PowerShell Environment] ------------
HostApplication = ConsoleHost
PSVersion = 5.1.16299.637
PSEdition = Desktop
PSCompatibleVersions = 1.0, 2.0, 3.0, 4.0, 5.0, 5.1.16299.637
BuildVersion = 10.0.16299.637
CLRVersion = 4.0.30319.42000
WSManStackVersion = 3.0
PSRemotingProtocolVersion = 2.3
SerializationVersion = 1.1.0.1
-------------- [Script Information] --------------
ScriptName = Set-PersonAge
ScriptVersion = 1.0
ScriptPath = C:\Temp\Set-PersonAge.ps1
ScriptParameter_Name = Bobby
ScriptParameter_Age = 24
--------------------------------------------------
[2018-10-04 14:33:54] [Information] Checking Bobby age.
[2018-10-04 14:33:54] [Error]       Failed to set Bobby age.
---------- [PowerShell Script Log End] -----------
EndTime = 2018-10-04 14:33:54
--------------------------------------------------
```

## EXAMPLES

### Script Best Practice

CWx.Script.Logging module has been designed to work with Test-ScriptFileInfo to gather script information.

To create a script with Script File Information use New-ScriptFileInfo cmdlet.
If you are planning on using prerelease version strings PowerShellGet version 1.6.0 or higher is required.

```powershell
<#PSScriptInfo

.VERSION 1.0.0

.GUID 036f1875-71a5-4e37-bf0b-b989788daf0a

.AUTHOR User1

.COMPANYNAME

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

#Requires -Module CWx.Script.Logging
#Requires -Module @{ ModuleName = 'PowerShellGet'; ModuleVersion = '1.6.0' }

<#

.DESCRIPTION
 <Description details placeholder>

#>
[CmdletBinding()]
Param()

$ScriptInfo = Test-ScriptFileInfo -Path $ScriptInvocation.MyCommand.Source
Start-ScriptLog -ScriptInfo $ScriptInfo -ArgumentList $PSBoundParameters -Append

# <Script logic>

Write-ScriptLog -Message 'Gathering information.'

# <Script logic>

Stop-ScriptLog
```

### Common / Interactive Workflow

To create a script log file and start writing messages.
Use Set-ScriptLogPath cmdlet to set the default script log path for the other cmdlets.
Start-ScriptLog will create a invocation block with details about the script execution.
Write-ScriptLog is used to write messages to the script log.
To end a script log use Stop-ScriptLog to write a script end time.

```powershell
C:\> Import-Module -Name CWx.Script.Logging
C:\> Set-ScriptLogPath -Path C:\Temp\script.log
C:\> Start-ScriptLog -ScriptName script -ScriptVersion 1.0 -ScriptPath C:\Temp\script.ps1 -ArgumentList @{}
C:\> Write-ScriptLog -Message 'Gathering information.'
C:\> Write-ScriptLog -Message 'Failed to do something.' -Level Error
C:\> Stop-ScriptLog
C:\> Import-ScriptLog

TimeStamp           Level       Message
---------           -----       -------
2018-10-04 14:33:54 Information Gathering information.
2018-10-04 14:33:54 Error       Failed to do something.
```

## TROUBLESHOOTING NOTE

Import-ScriptLog does not support multiple line messages.

## KEYWORDS

- Log
- Logging
- Script
