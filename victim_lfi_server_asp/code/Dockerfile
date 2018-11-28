FROM microsoft/dotnet:2.1.403-sdk

WORKDIR /webapp

COPY /code /webapp

RUN "dotnet build"
ENTRYPOINT dotnet run --urls http://0.0.0.0:5002
