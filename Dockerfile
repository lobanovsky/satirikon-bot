FROM gradle:8.13-jdk21 AS builder

WORKDIR /app
COPY . .
RUN gradle shadowJar --no-daemon


FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=builder /app/build/libs/satirikon-bot-all.jar app.jar

EXPOSE 8086

CMD ["java", "-jar", "app.jar"]
