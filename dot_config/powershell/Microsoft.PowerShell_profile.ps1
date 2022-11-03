using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module Terminal-Icons

### Default Parameter Values ###

#The output of every command ends up in $__
$PSDefaultParameterValues["Out-Default:OutVariable"] = "__"

#By default install modules on the user folder
$PSDefaultParameterValues["Install-Module:Scope"] = "CurrentUser"
$PSDefaultParameterValues["Install-PSResource:Scope"] = "CurrentUser"

### PSReadline options ###

Set-PSReadLineOption -EditMode Vi

if($env:TERM_PROGRAM -ne 'vscode')
{
    Set-PSReadLineOption -PredictionViewStyle ListView
}
else
{
    Set-PSReadLineOption -PredictionViewStyle InlineView
}

### Completers ###

# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($commandName, $wordToComplete, $cursorPosition)
    dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}

### History ###

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistoryNoDuplicates:$true

# Don't add sensitive stuff to history
Set-PSReadLineOption -AddToHistoryHandler {
    param([string]$line)
    $sensitive = "password|asplaintext|token|key|secret|hook|webhook"
    return ($line -notmatch $sensitive)
}

# Don't add stuff if it starts with a blank space, a semicolumn or the command is less than 3 characters
Set-PSReadLineOption -AddToHistoryHandler {
    param([string]$line)
    return $line.Length -gt 3 -and $line[0] -ne ' ' -and $line[0] -ne ';'
}

### KeyHandlers ###

# Open directory in VSCode
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