# Says hello to Max when he starts a new Claude session.
#
# All the actual content - jokes, tips, the banner shape - lives next door in
# max-context.json. This file just hands that over to Claude. If you want to
# change what the banner SAYS, edit the json, not this.

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# ReadAllText gives us plain text. (Get-Content tacks hidden extras onto the
# string, and they end up in the output as junk. Learned that the hard way.)
$context = [IO.File]::ReadAllText("$PSScriptRoot\max-context.json")

@{
  hookSpecificOutput = @{
    hookEventName     = 'SessionStart'
    additionalContext = $context
  }
  suppressOutput = $true
} | ConvertTo-Json -Depth 5 -Compress
