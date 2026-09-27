FROM maven:3.9-eclipse-temurin-17
WORKDIR /workspace
COPY pom.xml ./
RUN mvn -B -ntp dependency:go-offline
COPY config/ ./config/
COPY src/ ./src/
CMD ["mvn", "-B", "-ntp", "test"]
