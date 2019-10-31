---
external help file: ScriptLog-help.xml
Module Name: ScriptLog
online version:
schema: 2.0.0
---

# Reset-ScriptLog

## SYNOPSIS

Rotates a script log file.

## SYNTAX

```powershell
Reset-ScriptLog [[-Path] <String[]>] [[-Retention] <Int32>] [[-MaximumFileSize] <Int64>] [-PassThru]
 [<CommonParameters>]
```

## DESCRIPTION

This command rotates a script log file if the maximum file size is reached.
Historical logs will be kept according to the retention parameter.

## EXAMPLES

### Example 1

```powershell
PS C:\> Reset-ScriptLog -Path C:\Temp\UpdateScript.log
```

This command rotates `UpdateScript.log` if the default maximum file size is reached.

## PARAMETERS

### -MaximumFileSize

The file size when `Reset-ScriptLog` will rotate a log file.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Retention

The number of historical script log files to be retained.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
