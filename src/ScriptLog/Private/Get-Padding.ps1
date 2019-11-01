function Get-Padding {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $String,

        [Parameter()]
        [char]
        $PaddingCharacter = '-',

        [Parameter()]
        [int]
        $Width = 50,

        [Parameter()]
        [int]
        $InitialPadding = 1,

        [Parameter()]
        [int]
        $InitialPaddingCharacter = ' '
    )
    
    # Add inital padding character to each side of the string
    $String = $String.PadLeft(($String.Length + $InitialPadding), $InitialPaddingCharacter)
    $String = $String.PadRight(($String.Length + $InitialPadding), $InitialPaddingCharacter)
    
    # Center string by padding character
    $padding = [math]::Floor(($Width - $String.Length) / 2 )
    $leftPadding = $String.Length + $padding
    $String = $String.PadLeft($leftPadding, $PaddingCharacter)
    $String = $String.PadRight($Width, $PaddingCharacter)

    Write-Output -InputObject $String
}