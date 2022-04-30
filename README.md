# VenafiPS GitHub action

Automate Venafi with GitHub actions.

``` yaml
name: test

on:
  workflow_dispatch:

jobs:
  test-action:
    runs-on: ubuntu-latest
    steps:
      - uses: gdbarron/VenafiPS-action@main
        with:
          token: ${{ secrets.VENAFI_TOKEN }}
          server: server.company.com
          commands: |
            Find-VenafiCertificate -First 5 | Invoke-VenafiCertificateAction -Renew
```
