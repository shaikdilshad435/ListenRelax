# Dockerfile for Spring Boot TuneHub app
FROM eclipse-temurin:17-jdk

WORKDIR /app

# Copy the Spring Boot project
COPY TuneHub/ .

# Give execute permission to mvnw
RUN chmod +x mvnw

# Build the project without tests
RUN ./mvnw clean package -DskipTests

# Expose port (Render will assign dynamic PORT)
EXPOSE 8080
ENV SERVER_PORT=$PORT

# Run the exact JAR file produced by Maven
CMD ["java", "-jar", "target/TuneHub-0.0.1-SNAPSHOT.jar"]
