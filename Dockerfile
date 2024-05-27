# Use an official Maven image to build the project
FROM jelastic/maven:3.9.5-openjdk-21 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Build the project
RUN mvn clean package


# Specify the entry point for the container
ENTRYPOINT ["java", "--enable-preview", "-jar", "target/TodoListAmberJ.jar"]

# Expose the port the application runs on
EXPOSE 8000
