# Base image with OpenJDK 17
FROM eclipse-temurin:17-jdk-jammy

# Set working directory
WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the project using Maven wrapper
RUN ./mvnw clean package -DskipTests

# Expose the app port
EXPOSE 8080

# Set environment variable for Render
ENV PORT=8080

# Run the Spring Boot JAR
CMD ["java", "-jar", "target/TuneHub-0.0.1-SNAPSHOT.jar"]
