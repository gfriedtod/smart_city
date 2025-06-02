# Smart Cities Monorepo

This repository contains a comprehensive Smart Cities solution with a Spring Boot backend API and a Flutter mobile application.

## Project Structure
smart_cities/ ├── smart_api/ # Spring Boot Backend ├── smart_city_app/ # Flutter Mobile Application └── lib/ # Shared libraries (if any)

## Backend (smart_api)

The backend is built with Spring Boot and provides the REST API for the Smart Cities platform.

### Tech Stack

- Java 24
- Spring Boot
- Spring Data JPA
- Jakarta EE
- Lombok
- PostgreSQL (assumed based on JPA usage)

### Features

- RESTful API endpoints
- Domain-Driven Design architecture
- Database persistence
- JWT Authentication (if implemented)
- API Documentation with SpringDoc/Swagger

### Getting Started

```bash
cd smart_api
./gradlew build
./gradlew bootRun
```
## Frontend (smart_city_app)
The frontend is a Flutter mobile application that provides the user interface for the Smart Cities platform.
### Tech Stack
- Flutter
- Dart
- Clean Architecture
- State Management (Provider/Bloc/Riverpod)

### Project Structure

smart_city_app/
├── lib/
│   ├── domain/         # Business logic and domain models
│   │   ├── application/
│   │   ├── dto/        # Data Transfer Objects
│   │   └── entity/     # Domain Entities
│   ├── infrastructure/ # External services, repositories
│   ├── presentation/   # UI components
│   └── main.dart      # Entry point

### Features
- Clean Architecture implementation
- Domain-Driven Design
- Responsive UI
- Cross-platform support (iOS & Android)

### Getting Started
```bash
cd smart_city_app
flutter pub get
flutter run
```

## Development Setup
### Prerequisites
- JDK 24
- Flutter SDK
- Android Studio / VS Code
- Gradle
- Git

## License


This README provides a comprehensive overview of your monorepo structure and includes:

1. Project overview
2. Directory structure
3. Tech stack details for both projects
4. Setup instructions
5. Development guidelines
6. Build instructions
7. Placeholders for maintainers and license information





