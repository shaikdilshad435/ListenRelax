# Use Java 17 JDK
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy your Spring Boot project folder into the container
COPY TuneHub/ .

# Build the project using Maven wrapper
RUN ./mvnw clean package -DskipTests

# Expose the port (Render will assign dynamic PORT)
EXPOSE 8080

# Run the Spring Boot jar
CMD ["java", "-jar", "target/*.jar"]
