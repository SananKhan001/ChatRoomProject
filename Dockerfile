## build_1
FROM maven:3.8.7-eclipse-temurin-19 AS build_1

WORKDIR /app

COPY . /app

RUN mvn clean install

## build_2
FROM openjdk:11-jre-slim AS build_2

WORKDIR /app

COPY --from=build_1 /app/target/Chat-Room-Project-0.0.1-SNAPSHOT.jar /app

EXPOSE 8081

ENTRYPOINT [ "java", "-jar", "Chat-Room-Project-0.0.1-SNAPSHOT.jar"]