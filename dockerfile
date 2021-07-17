FROM mcr.microsoft.com/dotnet/sdk:5.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /code/SampleApp
COPY code/SampleApp/SampleApp.csproj code/SampleApp/
RUN dotnet restore "code/SampleApp/SampleApp.csproj"
COPY . .
WORKDIR "/code/SampleApp"
RUN dotnet build "code/SampleApp/SampleApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "code/SampleApp/SampleApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SampleApp.dll"]