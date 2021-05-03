FROM mcr.microsoft.com/dotnet/aspnet:5.0 as base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY ["dotnetapp.csproj", "./"]
RUN dotnet restore "dotnetapp.csproj"

# copy and publish app and libraries
COPY . .
RUN dotnet publish "dotnetapp.csproj" -c release -o /app/publish

# final stage/image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "dotnetapp.dll"]