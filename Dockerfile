# ---- Build Stage ----
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests

# ---- Run Stage ----
FROM tomcat:10.1.42-jre17-temurin-jammy

# Create non-root user with explicit uid/gid
RUN groupadd -r tomcat --gid=1000 && \
    useradd -r -s /bin/false -g tomcat --uid=1000 tomcat

# Remove default webapps as root
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy war file with proper ownership (use absolute path)
COPY --chown=tomcat:tomcat --from=build /app/target/spring-demo-app-1.0.war $CATALINA_HOME/webapps/ROOT.war

# Set restrictive permissions
RUN chmod 600 $CATALINA_HOME/webapps/ROOT.war

# Change ownership of Tomcat directories
RUN chown -R tomcat:tomcat $CATALINA_HOME

# Switch to non-root user
USER tomcat

EXPOSE 8080
CMD ["catalina.sh", "run"]