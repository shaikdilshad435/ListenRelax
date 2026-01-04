# Use Java 17 JDK
FROM eclipse-temurin:17-jdk

# Set working directory inside container
WORKDIR /app

# Copy your Spring Boot project folder into the container
COPY TuneHub/ .

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the project using Maven wrapper (skip tests to speed up)
RUN ./mvnw clean package -DskipTests

# Expose port 8080 (Render will assign dynamic PORT)
EXPOSE 8080

# Run the Spring Boot jar
CMD ["java", "-jar", "target/*.jar"]
