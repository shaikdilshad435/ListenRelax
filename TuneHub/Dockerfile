FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copy project files
COPY . .

# Fix mvnw permission (VERY IMPORTANT)
RUN chmod +x mvnw

# Build jar
RUN ./mvnw clean package -DskipTests

# Expose Render port
EXPOSE 8080
ENV PORT=8080

# Run Spring Boot
CMD ["java", "-jar", "target/TuneHub-0.0.1-SNAPSHOT.jar"]
