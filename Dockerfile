FROM gradle:7.6.0-jdk19

WORKDIR /app/testkuber
COPY src ./src
COPY build.gradle settings.gradle ./

# формируем jar файл из исходного кода
# печать логов в консоль тоже занимает время, поэтому когда убедились что все ок - убираем параметр stacktrace
RUN gradle clean bootJar -i --stacktrace

# открытие порта для внешних вызовов и запуск проекта
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/testkuber/build/libs/TestKuberSpring-0.0.1-SNAPSHOT.jar"]
