FROM microsoft/dotnet-framework:4.7.2-sdk

LABEL maintainer="secf00tprint@gmail.com"

WORKDIR /webapp

COPY /code /webapp

RUN "dotnet build"
ENTRYPOINT cmd.exe /c echo starting server on: external: %SERVER_HOST_EXTERNAL_IP%:%SERVER_HOST_EXTERNAL_PORT% ; dotnet run --urls http://0.0.0.0:5002
