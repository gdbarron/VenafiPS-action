gci env:

Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module VenafiPS -ErrorAction Stop

Invoke-Expression $env:commands
