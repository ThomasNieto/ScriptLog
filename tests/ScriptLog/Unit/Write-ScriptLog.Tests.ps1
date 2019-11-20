Describe 'Write-ScriptLog' {
    It 'Write message' {
        $message = 'This is a test.'
        $path = Join-Path -Path TestDrive: -ChildPath 'infoLine.log'

        $result = Write-ScriptLog -Message $message -Path $path -PassThru
        $content = Get-Content -Path $path
        
        $content -match '^\[(?<TimeStamp>.+)\] \[(?<Level>.+)\]\s+(?<Message>.+)' | Should -BeTrue
        $Matches['Message'] | Should -Be $message
        $Matches['Level'] | Should -Be 'Information'
        $Matches['TimeStamp'] -as [datetime] | Should -Be $result.TimeStamp
    }
}
