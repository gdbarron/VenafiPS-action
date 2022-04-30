FROM mcr.microsoft.com/powershell:latest

SHELL ["pwsh"]

COPY /entrypoint.ps1 /

ENTRYPOINT ["pwsh", "/entrypoint.ps1"]
