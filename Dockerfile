FROM mcr.microsoft.com/dotnet/sdk:5.0

WORKDIR /app

COPY ["./src/DevOpsChallenge.SalesApi/DevOpsChallenge.SalesApi.csproj", "./src/DevOpsChallenge.SalesApi/"]
COPY ["./src/DevOpsChallenge.SalesApi.Business/DevOpsChallenge.SalesApi.Business.csproj", "./src/DevOpsChallenge.SalesApi.Business/"]
COPY ["./src/DevOpsChallenge.SalesApi.Database/DevOpsChallenge.SalesApi.Database.csproj", "./src/DevOpsChallenge.SalesApi.Database/"]

RUN dotnet restore "./src/DevOpsChallenge.SalesApi/DevOpsChallenge.SalesApi.csproj"
COPY . .
RUN dotnet build "./src/DevOpsChallenge.SalesApi/DevOpsChallenge.SalesApi.csproj" -c Release -o /app/build

EXPOSE 80/tcp

ENV ASNETCORE_URLS=http://+:80

WORKDIR /app

ENTRYPOINT ["dotnet", "build/DevOpsChallenge.SalesApi.dll"]
