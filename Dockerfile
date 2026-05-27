# 1단계: 빌드
FROM gradle:8.14-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test --no-daemon \
    -Dorg.gradle.jvmargs="-Xmx384m -Xms128m" \
    -Dorg.gradle.daemon=false \
    -Dkotlin.incremental=false

# 2단계: 실행
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx384m", "-jar", "app.jar"]
