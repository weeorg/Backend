FROM ubuntu:latest
LABEL authors="itsri"
# Stage 1: Build the application
FROM maven:3.8.8-eclipse-temurin-17 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml .
COPY src ./src

# Run Maven build to create the JAR file
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/IPay-0.0.1-SNAPSHOT.jar app.jar

# Expose the port on which the app will run
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
