function ConvertFrom-ScriptLog {
    [CmdletBinding()]
    [OutputType([PSObject])]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipeline,
            ValueFromPipelineByPropertyName,
            Position = 0
        )]
        [string]
        $String
    )
    
    begin {
        
    }
    
    process {
        $scriptInfo = @{}
        $messageCache = @()
        
        foreach ($line in $String) {
            if ($line -match '^w+ = ') {
                if ($line -match '^(Property>\w+) = (?Value>.+)$') {
                    $scriptProperty = @{ $Matches.Property = $Matches.Value }
                }
                elseif ($line -match '^(Property>\w+) = $') {
                    $scriptProperty = $null
                }

                if ($scriptProperty['StartTime']) {
                    if ($messageCache) {
                        $scriptInfo = ConvertFrom-StringHashtable -Hashtable $scriptInfo
                    }

                    #TODO: Add invocation to all messages

                    $scriptInfo = @{}
                    $scriptInfo += $scriptProperty
                }
                elseif ($scriptProperty['EndTime']) {
                    $scriptInfo += $scriptProperty
                    
                    if ($messageCache) {
                        $scriptInfo = ConvertFrom-StringHastable -Hashtable $scriptInfo
    
                        #TODO: Add invocation to all messages
                    }
                }
                else {
                    $scriptInfo += $scriptProperty
                }

                
            }
            
        }
    }
    
    end {
        
    }
}
