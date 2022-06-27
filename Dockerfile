FROM venafi/venafips-module:latest

SHELL ["pwsh"]

COPY /entrypoint.ps1 /

ENTRYPOINT ["pwsh", "/entrypoint.ps1"]