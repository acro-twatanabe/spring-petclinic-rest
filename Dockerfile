FROM maven:3-jdk-11-slim AS rest-build

COPY . /work/spring-petclinic-rest/
WORKDIR /work/spring-petclinic-rest
RUN mvn clean package -DskipTests=true

# FROM docker.io/library/nginx:latest
FROM openjdk:11-slim
COPY --from=rest-build /work/spring-petclinic-rest/target/spring-petclinic-rest-2.1.5.jar /opt/spring-petclinic-rest-2.1.5.jar
WORKDIR /opt/
CMD java -jar spring-petclinic-rest-2.1.5.jar