# VenafiPS GitHub Action

Automate Venafi Trust Protection Platform or Venafi as a Service with GitHub Actions.  Utilizes the [VenafiPS Powershell module](https://github.com/venafi/venafips).

## Parameters
- **token**: provide either the TPP token or VaaS key
- **server**: server url, only required for TPP
- **commands**: list of powershell commands, including VenafiPS, to execute

``` yaml
name: deploy

on:
  label:
    types:
      - created
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: renew certs
        uses: gdbarron/venafips-action@main
        with:
          token: ${{ secrets.VENAFI_TOKEN }}
          server: ${{ secrets.VENAFI_SERVER }}
          commands: |
            Find-TppCertificate -Path '\ved\policy\certificates' | Invoke-VenafiCertificateAction -Renew
            $action_out = '' # set this variable to use in another step
```
