# VenafiPS GitHub action

Automate Venafi with GitHub actions.  Utilizes the [VenafiPS Powershell module](https://github.com/venafi/venafips).

``` yaml
name: test

on:
  workflow_dispatch:

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - name: renew certs
        uses: gdbarron/venafips-action@main
        with:
          token: ${{ secrets.VENAFI_TOKEN }}
          server: ${{ secrets.VENAFI_SERVER }}
          commands: |
            Find-VenafiCertificate -First 5 | Invoke-VenafiCertificateAction -Renew
            $action_out = '' # set this variable to use in another step
```
