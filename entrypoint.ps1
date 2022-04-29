$server = $env:INPUT_SERVER
$token = $env:INPUT_TOKEN

Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module VenafiPS -ErrorAction Stop

$objectGuid = [System.Guid]::empty

if ( [System.Guid]::TryParse($token, [System.Management.Automation.PSReference]$objectGuid) ) {

  Write-Output 'Token is VaaS key'
  New-VenafiSession -VaasKey (New-Object System.Management.Automation.PSCredential('AccessToken', ($token | ConvertTo-SecureString -AsPlainText -Force)))
}
else {

  Write-Output 'Token is TPP token'
  New-VenafiSession -Server $server -AccessToken (New-Object System.Management.Automation.PSCredential('AccessToken', ($token | ConvertTo-SecureString -AsPlainText -Force)))
}


Invoke-Expression $env:INPUT_COMMANDS
