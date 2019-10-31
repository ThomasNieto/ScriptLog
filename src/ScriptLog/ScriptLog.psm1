# This file is only used to import module within src folder

if (Test-Path -Path .\Module\PreLoad.ps1) {
    . .\Module\PreLoad.ps1
}

Get-ChildItem -Path .\Classes -Recurse -Filter *.ps1 |
ForEach-Object { . $_.FullName }

Get-ChildItem -Path .\Private -Recurse -Filter *.ps1 |
ForEach-Object { . $_.FullName }

Get-ChildItem -Path .\Public -Recurse -Filter *.ps1 |
ForEach-Object { . $_.FullName }

if (Test-Path -Path .\Module\PostLoad.ps1) {
    . .\Module\PostLoad.ps1
}
