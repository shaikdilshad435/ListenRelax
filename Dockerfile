# Use Java 17 base image
FROM eclipse-temurin:17-jdk-jammy

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml to download dependencies (optional)
COPY mvnw mvnw
COPY mvnw.cmd mvnw.cmd
COPY .mvn .mvn
COPY pom.xml pom.xml

# Download dependencies
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src src

# Build the JAR
RUN ./mvnw clean package -DskipTests

# Copy the built jar to root
RUN cp target/TuneHub-0.0.1-SNAPSHOT.jar TuneHub.jar

# Expose port
EXPOSE 8080
ENV PORT=8080

# Start the app
CMD ["java", "-jar", "TuneHub.jar"]
