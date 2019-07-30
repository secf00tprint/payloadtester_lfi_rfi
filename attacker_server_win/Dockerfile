FROM microsoft/powershell:6.0.4-windowsservercore-10.0.14393.2363

LABEL maintainer="secf00tprint@gmail.com"

# Add netcat to system, and code to put it to the path and and run docker container endlessly
COPY code code
ENTRYPOINT powershell 'Write-Host "starting server on: external: $($env:SERVER_HOST_EXTERNAL_IP):$($env:SERVER_HOST_EXTERNAL_PORT)"'; powershell -NonInteractive -NoExit -NoProfile -File code/run.ps1
