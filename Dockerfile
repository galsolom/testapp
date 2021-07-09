FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env

WORKDIR /app

COPY *.csproj ./
RUN dotnet restore


COPY . ./
RUN dotnet test

RUN dotnet publish -c Release -o release

FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=build-env /app/release .
ENTRYPOINT ["dotnet", "testapp.dll"]
