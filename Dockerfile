# Используем официальный .NET SDK как базовый образ
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /app

# Копируем .csproj и восстанавливаем зависимости
COPY *.csproj ./
RUN dotnet restore

# Копируем остальные файлы и компилируем приложение
COPY . ./
RUN dotnet publish -c Release -o out

# Используем рантайм-образ для запуска
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/out .

# Запускаем приложение на порту 10000
ENV ASPNETCORE_URLS=http://+:10000
EXPOSE 10000
ENTRYPOINT ["dotnet", "RobloxClothingAPI.dll"]
