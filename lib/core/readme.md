# Core Layer

The Core layer contains the fundamental building blocks of the application. It includes essential utilities, base classes, and common functionalities that are used across different layers of the application.

## Structure

- `exception.dart`: Contains custom exception classes used throughout the application.
- `usecase.dart`: Defines the base class for use cases, which encapsulate the application's business logic.

## exception.dart

This file includes custom exception classes that help in handling specific error scenarios in a more controlled manner. By defining custom exceptions, we can provide more meaningful error messages and handle errors more gracefully.

### Example

```dart
class CustomException implements Exception {
    final String message;
    CustomException(this.message);

    @override
    String toString() => 'CustomException: $message';
}
```

## usecase.dart

The `usecase.dart` file defines the base class for all use cases in the application. Use cases represent the application's business logic and are responsible for executing specific tasks.

### Example

```dart
abstract class UseCase<Type, Params> {
    Future<Type> call(Params params);
}

class NoParams {}
```

By following this structure, we ensure that our application's core functionalities are well-organized and maintainable.