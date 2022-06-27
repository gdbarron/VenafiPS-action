# $server = $env:INPUT_TPP_SERVER
# $token = $env:INPUT_TOKEN

# Set-PSRepository PSGallery -InstallationPolicy Trusted
# Install-Module VenafiPS -ErrorAction Stop

# $objectGuid = [System.Guid]::empty

# if ( -not $token ) {
#   throw "'token' parameter not provided"
# }

# if ( [System.Guid]::TryParse($token, [System.Management.Automation.PSReference]$objectGuid) ) {

#   Write-Output 'Token is VaaS key'
#   New-VenafiSession -VaasKey (New-Object System.Management.Automation.PSCredential('AccessToken', ($token | ConvertTo-SecureString -AsPlainText -Force)))
# }
# else {

#   Write-Output 'Token is TPP token'

#   if ( -not $server ) {
#     throw "'server' parameter is required when connecting to TPP"
#   }

#   New-VenafiSession -Server $server -AccessToken (New-Object System.Management.Automation.PSCredential('AccessToken', ($token | ConvertTo-SecureString -AsPlainText -Force)))
# }



$env:TPP_SERVER = $args[0]
$env:TPP_TOKEN = $args[1]
$env:VAAS_KEY = $args[2]

Invoke-Expression $env:INPUT_COMMANDS

if ( $action_out ) {
  Write-Output "::set-output name=action_out::$action_out"
}