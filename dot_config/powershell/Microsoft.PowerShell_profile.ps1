using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module Terminal-Icons
Import-Module PSReadLine

Set-PSReadLineOption -EditMode Vi

if($env:TERM_PROGRAM -ne 'vscode')
{
    Set-PSReadLineOption -PredictionViewStyle ListView
}
else
{
    Set-PSReadLineOption -PredictionViewStyle InlineView
}

Set-PSReadLineKeyHandler -Chord Ctrl+Alt+c -BriefDescription "OpenDirectoryInVSCode" -Description "Edit current directory in VS Code" -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadline]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadline]::Insert("code .")
    [Microsoft.PowerShell.PSConsoleReadline]::AcceptLine()
}

# Setting the starship prompt
Invoke-Expression (&starship init powershell)

# Setting z replacement (zoxide)
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})