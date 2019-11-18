---
external help file: ScriptLog-help.xml
Module Name: ScriptLog
online version: https://go.thomasnieto.com/Import-ScriptLog
schema: 2.0.0
---

# Import-ScriptLog

## SYNOPSIS

Imports script log into session.

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

{{ Fill in the Description }}

## EXAMPLES

### Example 1

```powershell
PS C:\> Import-ScriptLog -Path C:\Temp\Script.log
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

{{ Fill ScriptLogInfo Description }}

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
