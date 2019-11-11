---
external help file: ScriptLog-help.xml
Module Name: ScriptLog
online version: https://link.thomasnieto.com/Stop-ScriptLog
schema: 2.0.0
---

# Stop-ScriptLog

## SYNOPSIS

Stops the script log.

## SYNTAX

```powershell
Stop-ScriptLog [[-Path] <String[]>] [-PassThru] [<CommonParameters>]
```

## DESCRIPTION

This command stops the script log by writing the script end block.

## EXAMPLES

### Example 1

```powershell
PS C:\> Stop-ScriptLog -Path C:\Temp\UpdateScript.log
```

This command writes the script end block to the log file.

## PARAMETERS

### -PassThru

Outputs script information.

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

Specifies the path to the script log file.

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
