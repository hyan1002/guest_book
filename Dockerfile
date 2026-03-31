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
COPY --from=builder /usr/src/guest-book/target/guest_book-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java", "-jar", "/app/guest_book-0.0.1-SNAPSHOT.jar"]
