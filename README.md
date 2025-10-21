# Private School Trainers CRUD
A simple, production‑ready CRUD web application for managing Trainers in a Private School context, built with Spring Boot, Spring MVC (JSP views), Spring Data JPA, and MySQL. Packaged as a WAR and runnable via Spring Boot’s embedded Tomcat.

![](https://img.shields.io/badge/Code-Java-informational?style=flat&logo=java)
![](https://img.shields.io/badge/Framework-Spring%20Boot-informational?style=flat&logo=spring)
![](https://img.shields.io/badge/View-JSP-informational?style=flat)
![](https://img.shields.io/badge/Build-Maven-informational?style=flat&logo=apache-maven)
![](https://img.shields.io/badge/Database-MySQL-informational?style=flat&logo=mysql)

## Table of Contents
- Overview
- Features
- Tech Stack
- Architecture
- Getting Started
  - Prerequisites
  - Configure Database
  - Configure Application
  - Build & Run
- Application Endpoints & Views
- Data Model
- Project Structure
- Testing
- Troubleshooting
- Roadmap
- License

## Overview
This application demonstrates a clean CRUD over a Trainer entity (id, firstname, lastname, subject). It uses a classic MVC approach with JSP pages for the UI, a Spring MVC controller, a service layer, and Spring Data JPA repository backed by MySQL.

## Features
- Create, Read, Update, Delete Trainers
- JSP-based UI with server-side rendering
- Spring Data JPA for persistence
- MySQL database with Hibernate dialect
- WAR packaging; runnable with Spring Boot

## Tech Stack
- Java 8
- Spring Boot 2.1.x
- Spring MVC, Spring Data JPA
- JSP + JSTL
- MySQL 5.7+/8.0+
- Maven

## Architecture
- Controller: `com.example.demo.controller.TrainerController`
- Service: `com.example.demo.service.TrainerService`
- Repository: `com.example.demo.repositories.TrainerRepository` (extends Spring Data JPA)
- Entity: `com.example.demo.entities.Trainer`
- Views: JSP files under `src/main/webapp/WEB-INF/jsp`

## Getting Started
### Prerequisites
- JDK 8
- Maven 3.6+
- MySQL server running locally

### Configure Database
Create a database named `privateschool` and a `trainer` table if not already present. Example schema:

```sql
CREATE DATABASE IF NOT EXISTS privateschool CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE privateschool;

CREATE TABLE IF NOT EXISTS trainer (
  id INT NOT NULL,
  firstname VARCHAR(100) NOT NULL,
  lastname VARCHAR(100) NOT NULL,
  subject VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
```

Note: The Trainer `id` is not auto-generated in this project; provide it manually when inserting.

### Configure Application
Edit `trainersproject/src/main/resources/application.properties` as needed:

```
spring.datasource.url=jdbc:mysql://localhost:3306/privateschool?serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD

spring.mvc.view.prefix:/WEB-INF/jsp/
spring.mvc.view.suffix:.jsp

spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5InnoDBDialect
spring.jpa.hibernate.ddl-auto=update
```

### Build & Run
From the `trainersproject` module directory (where `pom.xml` is located):

- Build:
  - PowerShell: `mvn -q -DskipTests package`
- Run:
  - PowerShell: `mvn spring-boot:run`

The app will start on http://localhost:8080

## Application Endpoints & Views
- GET `/index.jsp` → Landing page
- GET `/inserttrainer.html` → Show form to create a Trainer (view: `inserttrainer.jsp`)
- POST `/doinserttrainer.html` → Create Trainer
- GET `/alltrainers.html` → List all trainers (view: `alltrainers.jsp`)
- GET `/updatetrainer/{id}.html` → Show update form (view: `updatetrainer.jsp`)
- POST `/updatetrainer/doupdatetrainer.html` → Update Trainer
- GET `/deletetrainer/{id}.html` → Delete Trainer and redirect to list

## Data Model
Entity: `Trainer`
- id: Integer (PK, required)
- firstname: String (1–100, required)
- lastname: String (1–100, required)
- subject: String (1–100, required)

## Project Structure
- `trainersproject/src/main/java/com/example/demo/controller/TrainerController.java` — MVC controller
- `trainersproject/src/main/java/com/example/demo/service/TrainerService.java` — business logic
- `trainersproject/src/main/java/com/example/demo/repositories/TrainerRepository.java` — data access
- `trainersproject/src/main/java/com/example/demo/entities/Trainer.java` — JPA entity
- `trainersproject/src/main/webapp/WEB-INF/jsp/*.jsp` — JSP views
- `trainersproject/src/main/resources/application.properties` — app configuration
- `trainersproject/pom.xml` — Maven build

## Testing
- Unit/Integration tests can be added under `src/test/java`. A basic Spring Boot test class exists: `TrainersProjectApplicationTests`.
- Run tests: `mvn test`

## Troubleshooting
- Cannot connect to MySQL: verify `spring.datasource.*` values and that MySQL is running. Check user permissions for the `privateschool` DB.
- Table missing: ensure the `trainer` table exists (see schema above) or let Hibernate create/update with `spring.jpa.hibernate.ddl-auto=update`.
- Port conflict on 8080: set `server.port=8081` (or another) in `application.properties`.

## Roadmap
- Add REST API alongside JSP views
- Add validation messages and error handling on forms
- Add pagination and search on trainer list

## License
This project is provided under the MIT License. Feel free to use and modify.
