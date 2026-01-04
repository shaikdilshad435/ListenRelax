# Use Java 17 JDK
FROM eclipse-temurin:17-jdk

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Build the project using Maven wrapper
RUN ./mvnw clean package -DskipTests

# Expose port 8080 (Render will use dynamic PORT)
EXPOSE 8080

# Run the Spring Boot app
CMD ["java","-jar","target/*.jar"]
