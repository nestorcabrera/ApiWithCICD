# Usa la imagen oficial de .NET como imagen base
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 5004

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ApiWithCICD.csproj", "./"]
RUN dotnet restore "ApiWithCICD.csproj"
COPY . .
WORKDIR /src
RUN dotnet build "ApiWithCICD.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ApiWithCICD.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ApiWithCICD.dll"]