FROM maven:3.9.7-amazoncorretto-21-debian AS builder

WORKDIR /usr/src/guest-book
COPY pom.xml .
RUN mvn -B dependency:go-offline

COPY . .
# 앞에 .은 로컬의 모든것, 뒤에 .은 현재 위치
RUN mvn package -DskipTests

# app
FROM amazoncorretto:21.0.3

WORKDIR /app
# [수정 포인트] 파일명을 직접 적지 말고 *.jar를 사용하여 app.jar로 이름을 바꿉니다.
COPY --from=builder /usr/src/guest-book/target/*.jar app.jar

# [수정 포인트] 위에서 지정한 app.jar를 실행합니다.
ENTRYPOINT ["java", "-jar", "app.jar"]
