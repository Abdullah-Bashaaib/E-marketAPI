# E-Market API

![Flutter Version](https://img.shields.io/badge/Flutter-3.6.0-blue)
![Dart Version](https://img.shields.io/badge/Dart-3.6.0-blue)

A modern e-commerce mobile application built with Flutter that integrates with the DummyJSON API to showcase products by categories. This application demonstrates how to work with RESTful APIs in Flutter, implementing clean architecture principles with a focus on separation of concerns.

## Features

- Browse product categories
- View products by category
- View detailed product information
- Clean and intuitive UI with Cupertino design
- Responsive layout for various device sizes

## Screenshots

<!-- Add your screenshots here -->

## Architecture

The application follows a clean architecture approach with:

- **Models**: Data structures representing categories and products
- **Controllers**: Handle API requests and business logic
- **Views**: UI components and screens

## API Integration

This application integrates with the [DummyJSON API](https://dummyjson.com/) to fetch:

- Product categories
- Products by category
- Detailed product information

## Dependencies

- Flutter SDK: ^3.6.0
- http: ^1.2.0 - For API requests
- cupertino_icons: ^1.0.8 - For iOS style icons

## Getting Started

### Prerequisites

- Flutter SDK (version 3.6.0 or higher)
- Dart SDK (version 3.6.0 or higher)
- Android Studio / VS Code
- An emulator or physical device

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Abdullah-Bashaaib/E-marketAPI.git
   ```

2. Navigate to the project directory:
   ```bash
   cd e_market_api
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── controllers/      # API and business logic
├── models/           # Data models
├── views/            # UI screens
└── main.dart         # Application entry point
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [DummyJSON](https://dummyjson.com/) for providing the free API
- Flutter team for the amazing framework

## Contact

Abdullah Bashaaib - [GitHub](https://github.com/Abdullah-Bashaaib)
