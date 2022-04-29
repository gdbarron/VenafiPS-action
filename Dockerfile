FROM mcr.microsoft.com/powershell:latest

SHELL ["pwsh"]

COPY /*.ps1 /

ENTRYPOINT ["pwsh", "/entrypoint.ps1"]
