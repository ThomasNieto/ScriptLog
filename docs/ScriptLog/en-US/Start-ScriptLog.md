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
Start-ScriptLog [[-Path] <String>] [-ScriptInfo <PSObject>] [-BoundParameters <IDictionary>]
 [-NoEnvironmentInfo] [-NoClobber] [-Append] [-PassThru] [<CommonParameters>]
```

### OutputDirectory

```powershell
Start-ScriptLog [[-OutputDirectory] <String>] [-ScriptInfo <PSObject>] [-BoundParameters <IDictionary>]
 [-NoEnvironmentInfo] [-NoClobber] [-Append] [-PassThru] [<CommonParameters>]
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

### -Append

Indicates that this command adds the new script log to the end of an existing file.

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

### -NoClobber

Indicates that this command will not overwrite of an existing file.
By default, if a transcript file exists in the specified path, Start-ScriptLog overwrites the file without warning.

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

### -OutputDirectory

Specifies a specific path and folder in which to save a transcript.
The command automatically assigns the script log name.

```yaml
Type: String
Parameter Sets: OutputDirectory
Aliases:

Required: False
Position: 0
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

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ScriptInfo

Script information from `Test-ScriptFileInfo` cmdlet.

```yaml
Type: PSObject
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

[Stop-ScriptLog]()

[Write-ScriptLog]()

[Import-ScriptLog]()
