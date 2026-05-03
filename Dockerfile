# Use lightweight Java image
# ---------- Stage 1: Build the application
FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /build

#Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

#Copy source code
COPY src ./src

#Package the application
RUN mvn clean package -DskipTests

# ------ Stage 2: Run the application
FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

#Copu the build JAR from the build stage
COPY --from=build /build/target/jenkins-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 9090

# Run app
ENTRYPOINT ["java","-jar","/app.jar"]