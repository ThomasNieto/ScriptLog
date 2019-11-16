---
external help file: ScriptLog-help.xml
Module Name: ScriptLog
online version: https://go.thomasnieto.com/Start-ScriptLog
schema: 2.0.0
---

# Start-ScriptLog

## SYNOPSIS

Writes the script invocation information to log file.

## SYNTAX

### Path (Default)

```powershell
Start-ScriptLog [-Path] <String> [-ScriptName <String>] [-ScriptVersion <Version>] [-BoundParameters <IDictionary>]
 [-NoEnvironmentInfo] [-PassThru] [<CommonParameters>]
```

### ScriptInfo

```powershell
Start-ScriptLog [[-ScriptInfo] <PSObject>] [-BoundParameters <IDictionary>] [-NoEnvironmentInfo]
 [-PassThru] [<CommonParameters>]
```

## DESCRIPTION

This command creates the log file if it doesn't exist and optionally writes script invocation details.

## EXAMPLES

### Example 1

```powershell
PS C:\> Start-ScriptLog -Path C:\Temp\UpdateScript.log
```

This command starts a script log.

## PARAMETERS

### -BoundParameters

Specifies the PSBoundParameters of the script writing the parameters to invocation header.

```yaml
Type: IDictionary
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoEnvironmentInfo

Skips writing environment information to log file.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru

Output script log information.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path

Specifies the path to the script log.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ScriptInfo

Script information from `Test-ScriptFileInfo` cmdlet.

```yaml
Type: PSObject
Parameter Sets: ScriptInfo
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ScriptName

Specifies the script name for the invocation header.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptVersion

Specifies the script version for the invocation header.

```yaml
Type: Version
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
