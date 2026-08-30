FROM maven:3.9-eclipse-temurin-17
WORKDIR /app
COPY . .
RUN mvn package
ENTRYPOINT ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]
