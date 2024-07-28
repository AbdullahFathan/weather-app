# Weather App

---

## How to run flutter app

First, clone this repo:

```bash
git clone https://github.com/AbdullahFathan/weather-app.git
```

open project folder on your code editor and run this command:

```bash
flutter pub get
```

change the `.env.example` to `.env` and **ask** the owner for **the code.**

```diff
- .env.example
+ .env
```

after you got the `.env` code, put the code inside the file.

run this command to start project on your machine

```bash
flutter run
```

## How to run flutter test

for run the unit test flutter, just run this command

```bash
flutter test
```

## Third-Party Libraries

### 1. bloc & flutter_bloc

- **Function**: Implements the BLoC (Business Logic Component) pattern, which helps manage state in a predictable way.
- **Justification**: BLoC is a popular choice for state management in Flutter due to its separation of business logic from UI code.

### 2. cached_network_image

- **Function**: Efficiently loads and caches network images to improve performance and reduce data usage.
- **Justification**: This library is essential for applications that display many images from the internet, as it reduces the need to repeatedly download images, thus saving bandwidth and speeding up the application.

### 3. connectivity_plus

- **Function**: Checks the device's network connectivity status.
- **Justification**: It provides a reliable way to handle online and offline states in the application, which is crucial for apps that rely on internet connectivity.

### 4. dio

- **Function**: A powerful HTTP client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, and more.
- **Justification**: Dio is chosen for its flexibility and comprehensive feature set, making it easier to handle complex networking tasks and customize the behavior of HTTP requests.

### 5. equatable

- **Function**: Simplifies value comparison in Dart by overriding equality and hashcode.
- **Justification**: This library reduces boilerplate code for equality checks, which is particularly useful when working with BLoC and state management.

### 6. flutter_dotenv

- **Function**: Loads environment variables from a .env file.
- **Justification**: It allows for easy configuration of environment-specific variables

### 7. flutter_svg

- **Function**: Renders SVG (Scalable Vector Graphics) files in Flutter applications.
- **Justification**: SVGs are often used for icons and illustrations due to their scalability and small file size. This library makes it easy to include and render SVGs in Flutter.

### 8. hive and hive_flutter

- **Function**: Hive is a lightweight and fast key-value database, while hive_flutter adds support for Flutter.
- **Justification**: Hive is chosen for its simplicity and performance, making it suitable for caching and storing small amounts of structured data locally.

### 9. intl

- **Function**: Provides internationalization and localization support, including date and number formatting.
- **Justification**: This library is essential for making the application accessible to users from different regions by supporting multiple languages and locale-specific formats.

### 10. mockito

- **Function**: A mocking framework for Dart, used in unit tests.
- **Justification**: Mockito simplifies the creation of mock objects, making it easier to write unit tests for classes that depend on other services or components.

### 11. path_provider

- **Function**: Provides access to commonly used locations on the filesystem, such as the temporary and app-specific directories.
- **Justification**: This library is necessary for saving files and accessing application directories in a platform-independent way.

### 12. build_runner

- **Function**: Provides a concrete way to generate files using Dart code generators.
- **Justification**: It is widely used for code generation tasks, such as generating JSON serialization code, making development more efficient and reducing boilerplate.

### 13. flutter_gen_runner

- **Function**: Generates assets and fonts classes from your pubspec.yaml.
- **Justification**: This tool helps manage assets and fonts by generating type-safe references, reducing the risk of errors due to incorrect asset paths or font names.

---

## Thank you!
