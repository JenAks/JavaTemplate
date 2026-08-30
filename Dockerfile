FROM maven:3.9-eclipse-temurin-17
WORKDIR /app
COPY . .
RUN mvn dependency:resolve
ADD --chmod=755 https://github.com/seal-community/cli/releases/download/latest/seal-linux-amd64-latest seal
ENV SEAL_PROJECT="java-template-qa"
RUN --mount=type=secret,id=SEAL_TOKEN export SEAL_TOKEN=$(cat /run/secrets/SEAL_TOKEN) && ./seal fix --mode remote pom.xml --remove-cli
RUN mvn package
ENTRYPOINT ["java", "-jar", "target/my-app-1.0-SNAPSHOT.jar"]
