# syntax=docker/dockerfile:1

### Build stage ###
FROM eclipse-temurin:17-jdk AS build
WORKDIR /workspace

# Use .dockerignore to avoid copying target, .git, etc.
COPY mvnw ./
COPY .mvn .mvn
COPY pom.xml ./
# Cache dependencies (optional): uncomment if you want dependency caching by copying only pom first
# RUN ./mvnw dependency:go-offline -B

COPY src ./src
RUN chmod +x ./mvnw && \
    ./mvnw -B -DskipTests clean package

### Run stage ###
FROM eclipse-temurin:17-jre
WORKDIR /app

# copy the built jar (wildcard makes it robust to version changes)
ARG JAR_FILE=target/*.jar
COPY --from=build /workspace/${JAR_FILE} ./app.jar

EXPOSE 8761
ENTRYPOINT ["java","-jar","/app/app.jar"]
