| Commandes PowerShell Essentielles | Description |
|----------------------------------|-------------|
| `Get-Process -Confirm:$false`    | Obtains the list of active processes without asking for confirmation.  | 
| `Remove-Item -Confirm:$false`   | Deletes an item without confirmation prompt.  |

*Note*: Adding `-Confirm:$false` to these commands means they will execute without asking for confirmation, allowing for more efficient automation in scripts. Use with caution!