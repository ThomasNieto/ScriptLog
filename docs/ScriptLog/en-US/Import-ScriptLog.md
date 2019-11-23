---
external help file: ScriptLog-help.xml
Module Name: ScriptLog
online version: https://go.thomasnieto.com/Import-ScriptLog
schema: 2.0.0
---

# Import-ScriptLog

## SYNOPSIS

Imports a script log file into a table like structure.

## SYNTAX

### Path (Default)

```powershell
Import-ScriptLog [-Path] <String[]> [<CommonParameters>]
```

### ScriptLogInfo

```powershell
Import-ScriptLog [-ScriptLogInfo] <ScriptLogInfo> [<CommonParameters>]
```

## DESCRIPTION

This command parses a script log file into a table like structure.
This allows for quick filtering of the data without having to open the file directly.

## EXAMPLES

### Example 1

```powershell
PS C:\> Import-ScriptLog -Path C:\Temp\MSI_Install.log

TimeStamp              Level       Message
---------              -----       -------
11/19/2019 10:08:00 PM Information Started C:\Temp\installer.msi
11/19/2019 10:08:15 PM Error       MSI install failed.
11/19/2019 10:08:30 PM Information Deleted file C:\Temp\installer.msi
```

This command imports the script log file parsing the contents.

## PARAMETERS

### -Path

Specifies the path to the script log.

```yaml
Type: String[]
Parameter Sets: Path
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ScriptLogInfo

Specifies the script log configuration to use.

```yaml
Type: ScriptLogInfo
Parameter Sets: ScriptLogInfo
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

### ScriptLogInfo

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[Start-ScriptLog]()

[Stop-ScriptLog]()

[Write-ScriptLog]()
