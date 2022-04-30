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
          server: gdb-tpp.se.venafi.com
          commands: |
            find-venaficertificate -first 5
```
