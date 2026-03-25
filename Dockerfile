# 1. Obraz Javy 21
FROM openjdk:21-slim

# 2. Katalog roboczy wewnątrz kontenera
WORKDIR /app

# 3. Kopiujemy plik .jar do kontenera
COPY target/my-app-1.0-SNAPSHOT.jar app.jar

# 4. Port działania Aplikacji
EXPOSE 8080

# 5. Komenda uruchamiająca aplikację po starcie kontenera
ENTRYPOINT ["java", "-jar", "app.jar"]