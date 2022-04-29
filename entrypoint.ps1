gci env:

Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module VenafiPS -ErrorAction Stop

New-VenafiSession -Server ($env:INPUT_SERVER) -AccessToken (New-Object System.Management.Automation.PSCredential('AccessToken', ($env:INPUT_TOKEN | ConvertTo-SecureString -AsPlainText -Force)))

Invoke-Expression $env:INPUT_COMMANDS
