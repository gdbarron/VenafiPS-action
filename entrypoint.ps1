gci env:

Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module VenafiPS -ErrorAction Stop

New-VenafiSession -Server ($env:input_server) -AccessToken (New-Object System.Management.Automation.PSCredential('AccessToken', ($env:input_token | ConvertTo-SecureString -AsPlainText -Force)))

Invoke-Expression $env:input_commands
