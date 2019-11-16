---
external help file: ScriptLog-help.xml
Module Name: ScriptLog
online version: https://go.thomasnieto.com/Write-ScriptLog
schema: 2.0.0
---

# Write-ScriptLog

## SYNOPSIS

Writes a message to the script log.

## SYNTAX

```powershell
Write-ScriptLog [-Message] <String> [-Level <LogLevel>] [-PassThru] [<CommonParameters>]
```

## DESCRIPTION

This command writes script information messages to the script log.

## EXAMPLES

### Example 1

```powershell
PS C:\> Write-ScriptLog -Message "Update successful"
```

This command writes a 'Update successful' message to the script log file.

## PARAMETERS

### -Level

The log level indicator.

```yaml
Type: LogLevel
Parameter Sets: (All)
Aliases:
Accepted values: Information, Warning, Error, Debug

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Message

The message details to write to the log.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
