New-NetFirewallRule `
-DisplayName "Bloquer Telnet" `
-Direction Inbound `
-Protocol TCP `
-LocalPort 23 `
-Profile Private `
-Action Block