# 로컬에서 미리 빌드된 JAR를 그대로 실행
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY build/libs/pinword-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx384m", "-jar", "app.jar"]
