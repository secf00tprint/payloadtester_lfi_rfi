FROM microsoft/dotnet:2.1.403-sdk

WORKDIR /webapp

COPY /code /webapp

RUN "dotnet build"
ENTRYPOINT cmd.exe /c echo starting server on: external: %SERVER_HOST_EXTERNAL_IP%:%SERVER_HOST_EXTERNAL_PORT% ; dotnet run --urls http://0.0.0.0:5002
