# Localization data for en-US

ConvertFrom-StringData -StringData @"
    DefaultScriptName       = PowerShell_script
    DefaultScriptFullName   = {0}.{1}.{2}.{3:yyyyMMddTHHmmss}.log
    
    # Script Log Blocks
    ScriptLogStartHeader    = [PowerShell Script Log Start]
    ScriptLogEndFooter      = [PowerShell Script Log End]
    EnvironmentHeader       = [PowerShell Environment]
    ScriptInvocationHeader  = [PowerShell Script Information]
    DividerLength           = 50
    DividerCharacter        = -

    # Errors
    FileExistsNoClobber    = File '{0}' already exists and NoClobber was specified.
    FileNotFound           = File '{0}' does not exist, unable to stop script log file.
"@
