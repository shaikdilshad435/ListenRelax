# ===============================
# BUILD STAGE
# ===============================
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app

# Copy all project files
COPY . .

# Fix mvnw permission and build jar
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# ===============================
# RUNTIME STAGE (lightweight)
# ===============================
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Copy only the jar from build stage
COPY --from=build /app/target/TuneHub-0.0.1-SNAPSHOT.jar app.jar

# Expose the port Render will assign
EXPOSE 8080
ENV PORT=8080

# Run Spring Boot
CMD ["java", "-jar", "app.jar"]
