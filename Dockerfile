# Use an official Maven image to build the project
FROM jelastic/maven:3.9.5-openjdk-21 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src
COPY target/TodoListAmberJ-1.0-SNAPSHOT.jar .


# Specify the entry point for the container
ENTRYPOINT ["java", "--enable-preview", "-jar", "TodoListAmberJ-1.0-SNAPSHOT.jar"]

# Expose the port the application runs on
EXPOSE 8000
