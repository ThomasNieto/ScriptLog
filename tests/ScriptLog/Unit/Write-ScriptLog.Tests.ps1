Describe 'Write-ScriptLog' {
    It 'Write message' {
        $message = 'This is a test.'
        $path = Join-Path -Path TestDrive: -ChildPath 'infoLine.log'

        Write-ScriptLog -Message $message -Path $path
        $content = Get-Content -Path $path
        
        if ($content -match '\[(?<TimeStamp>.+)\] \[(?<Level>.+)\] (?<Message>.+)') {
            $Matches['Message'] | Should -Be $message
            $Matches['Level'] | Should -Be 'Information'
            $Matches['TimeStamp'] -as [datetime] | Should -BeOfType System.DateTime
        }
        else {
            throw 'Regex not working'
        }
    }
}