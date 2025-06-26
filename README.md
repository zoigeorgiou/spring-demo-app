# Spring Demo App

This is a simple Spring Boot demo application that displays a homepage with the message:

```
Welcome to demo app version 1.0
```

The version number is managed as a variable in the controller and passed to the view.

## Requirements
- Java 17 or higher
- Maven 3.6+

## Build and Run

1. **Clone or download this repository.**
2. **Navigate to the project directory.**
3. **Build the project (JAR and WAR):**
   ```
   mvn clean package
   ```
   This will generate both a JAR and a WAR file in the `target/` directory.
4. **Run the application:**
   ```
   mvn spring-boot:run
   ```

5. **Deploy the WAR file to Tomcat:**
   - Copy the generated WAR file (`target/spring-demo-app-1.0.war`) to the `webapps/` directory of your Tomcat server.
   - Start Tomcat (if not already running).
   - Access the application at: [http://localhost:8080/spring-demo-app](http://localhost:8080/spring-demo-app)

6. **Open your browser and go to:**
   [http://localhost:8080](http://localhost:8080) (for standalone JAR)
   or
   [http://localhost:8080/spring-demo-app](http://localhost:8080/spring-demo-app) (for Tomcat WAR deployment)

You should see the homepage message with the version number. 