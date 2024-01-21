## build_1
FROM maven:3.5-jdk-8-alpine AS build_1

WORKDIR /app

COPY . /app

RUN mvn clean install

## build_2
FROM openjdk AS build_2

WORKDIR /app

COPY --from=build_1 /app/target/Chat-Room-Project-0.0.1-SNAPSHOT.jar /app

ENTRYPOINT [ "java" ]
CMD [ "-jar", "Chat-Room-Project-0.0.1-SNAPSHOT.jar" ]