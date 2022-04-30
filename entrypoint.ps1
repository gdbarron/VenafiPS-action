$server = $env:INPUT_SERVER
$token = $env:INPUT_TOKEN

Set-PSRepository PSGallery -InstallationPolicy Trusted
Install-Module VenafiPS -ErrorAction Stop

$objectGuid = [System.Guid]::empty

if ( -not $token ) {
  throw "'token' parameter not provided"
}

if ( [System.Guid]::TryParse($token, [System.Management.Automation.PSReference]$objectGuid) ) {

  Write-Output 'Token is VaaS key'
  New-VenafiSession -VaasKey (New-Object System.Management.Automation.PSCredential('AccessToken', ($token | ConvertTo-SecureString -AsPlainText -Force)))
}
else {

  Write-Output 'Token is TPP token'
  
  if ( -not $server ) {
    throw "'server' parameter is required when connecting to TPP"
  }
  
  New-VenafiSession -Server $server -AccessToken (New-Object System.Management.Automation.PSCredential('AccessToken', ($token | ConvertTo-SecureString -AsPlainText -Force)))
}


Invoke-Expression $env:INPUT_COMMANDS
