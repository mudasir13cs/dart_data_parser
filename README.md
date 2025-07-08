# Dart Data Parser

A comprehensive utility library for parsing and transforming data types in Dart with **zero external dependencies**. This library provides a wide range of utility functions for type conversions, string manipulations, data validation, and more.

## Features

- **Type Conversions**: Convert between different data types (int, double, bool, string)
- **String Manipulation**: Capitalize, transform, and format strings
- **Data Validation**: Email validation and data type checking
- **Encoding/Decoding**: Base64 encoding and JSON operations
- **Mathematical Operations**: Distance calculations and random number generation
- **File Operations**: File extension extraction and byte formatting
- **Platform Detection**: Cross-platform detection for all supported platforms
- **Zero Dependencies**: No external packages required

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  dart_data_parser: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

### Basic Usage

```dart
import 'package:dart_data_parser/dart_data_parser.dart';

void main() {
  // Use the global instance
  int number = dataParser.getInt("123");
  String text = dataParser.getString(null); // Returns empty string
  bool isValid = dataParser.isValidEmail("test@example.com");
  
  // Or create your own instance
  final parser = DartDataParser();
  double value = parser.getDouble("12.34");
}
```

### Type Conversions

```dart
// Integer conversions
int value1 = dataParser.getInt("123");          // 123
int value2 = dataParser.getInt(true);           // 1
int value3 = dataParser.getInt(null);           // 0
int value4 = dataParser.getIntDefaultNegative(null); // -1

// Double conversions
double d1 = dataParser.getDouble("12.34");      // 12.34
double d2 = dataParser.getDouble(null);         // 0.0

// Boolean conversions
bool b1 = dataParser.getBool("true");           // true
bool b2 = dataParser.getBool(1);                // true
bool b3 = dataParser.getBool("false");          // false

// String conversions
String s1 = dataParser.getString(123);          // "123"
String s2 = dataParser.getString(null);         // ""
```

### String Manipulation

```dart
// Capitalize first letter
String capitalized = dataParser.uCFirst("hello");           // "Hello"
String titleCase = dataParser.strToTitleCase("hello world"); // "Hello World"

// String transformations
String transformed = dataParser.getStringTransformed("rejected"); // "Declined"
String urlSafe = dataParser.getUrlString("hello world");          // "hello%20world"

// Extract words
String firstWord = dataParser.getFirstWordFromString("Hello World");     // "Hello"
String twoWords = dataParser.getTwoWordFromString("Hello World Test");   // "Hello World"
```

### Data Validation

```dart
// Email validation
bool isValidEmail = dataParser.isValidEmail("user@example.com");  // true
bool isInvalidEmail = dataParser.isValidEmail("invalid-email");   // false

// Type checking
bool isDouble = dataParser.isDouble("12.34");  // true
bool isNotDouble = dataParser.isDouble("abc"); // false
```

### Encoding and Decoding

```dart
// Base64 operations
String encoded = dataParser.base64Encoder("Hello World");
String decoded = dataParser.base64Decoder(encoded);

// JSON operations
Map<String, dynamic> data = {"name": "John", "age": 30};
String jsonString = dataParser.encodeMap(data);
Map<String, dynamic> decodedMap = dataParser.decodeMap(jsonString);

// Base64 encode all values in a map
Map<String, String> encodedValues = dataParser.encodeBase64Value(data);
```

### Mathematical Operations

```dart
// Distance calculation using Haversine formula
double distance = dataParser.calculateDistance(
  40.7128,  // lat1 (New York)
  -74.0060, // lon1
  34.0522,  // lat2 (Los Angeles)
  -118.2437 // lon2
); // Returns distance in kilometers

// Random number generation
int randomNum = dataParser.generateRandomNumber();        // 0-9999
String randomString = dataParser.getRandString(10);       // Random base64 string
String alphanumeric = dataParser.genRandString(8);        // Random alphanumeric
```

### File Operations

```dart
// File extension extraction
String extension = dataParser.getFileExtension("document.pdf");  // "pdf"

// Byte formatting
String formatted1 = dataParser.formatBytes(1024, 2);      // "1.00 KB"
String formatted2 = dataParser.formatBytes(1048576, 1);   // "1.0 MB"
```

### Platform Detection

```dart
// Platform detection
String platform = dataParser.getPlatform();              // "android", "ios", "web", etc.
String os = dataParser.getOs();                          // "ANDROID", "IOS", "WEB", etc.

// Platform checks
bool isMobile = dataParser.isMobile();                    // true on Android/iOS
bool isDesktop = dataParser.isDesktop();                  // true on Windows/macOS/Linux
bool isWeb = dataParser.isWeb();                          // true on web
bool isAndroid = dataParser.isAndroid();                  // true on Android
bool isIOS = dataParser.isIOS();                          // true on iOS
bool isWindows = dataParser.isWindows();                  // true on Windows
bool isMacOS = dataParser.isMacOS();                      // true on macOS
bool isLinux = dataParser.isLinux();                      // true on Linux
bool isFuchsia = dataParser.isFuchsia();                  // true on Fuchsia
```

### Collection Operations

```dart
// Safe list/map operations
List<dynamic> safeList = dataParser.getDynamicList(someData);
Map<dynamic, dynamic> safeMap = dataParser.getDynamicMap(someData);

// Null-safe string operations
String withComma = dataParser.getCharForNullString("text", chr: ",");  // ","
String withDashes = dataParser.getDashsForNullString(null);            // "---"
```

## API Reference

### Type Conversion Methods

- `getInt(dynamic)` - Convert to integer (default: 0)
- `getIntDefaultNegative(dynamic)` - Convert to integer (default: -1)
- `getDouble(dynamic)` - Convert to double (default: 0.0)
- `getBool(dynamic)` - Convert to boolean
- `getString(dynamic)` - Convert to string
- `getDate(dynamic)` - Convert to DateTime

### String Methods

- `uCFirst(String)` - Capitalize first character
- `strToTitleCase(String)` - Convert to title case
- `toCapitalized(String)` - Capitalize and lowercase rest
- `getStringTransformed(String)` - Transform with special rules
- `getUrlString(String)` - URL encode spaces
- `getDashFromString(String)` - Replace dashes/underscores with spaces

### Validation Methods

- `isValidEmail(String)` - Validate email format
- `isDouble(String)` - Check if string is valid double

### Encoding/Decoding Methods

- `base64Encoder(String)` - Encode to base64
- `base64Decoder(String)` - Decode from base64
- `encodeMap(Map)` - Encode map to JSON
- `decodeMap(String)` - Decode JSON to map

### Utility Methods

- `calculateDistance(lat1, lon1, lat2, lon2)` - Calculate distance between coordinates
- `generateRandomNumber()` - Generate random number (0-9999)
- `getRandString(int)` - Generate random base64 string
- `genRandString(int)` - Generate random alphanumeric string
- `formatBytes(int, int)` - Format bytes to human readable

### Platform Detection Methods

- `getPlatform()` - Get current platform as string
- `getOs()` - Get current OS as enum-like string
- `isMobile()` - Check if platform is mobile (Android/iOS)
- `isDesktop()` - Check if platform is desktop (Windows/macOS/Linux)
- `isWeb()` - Check if platform is web
- `isAndroid()` - Check if platform is Android
- `isIOS()` - Check if platform is iOS
- `isWindows()` - Check if platform is Windows
- `isMacOS()` - Check if platform is macOS
- `isLinux()` - Check if platform is Linux
- `isFuchsia()` - Check if platform is Fuchsia

## Platform Support

This library supports all Dart/Flutter platforms:

- **Mobile**: Android, iOS
- **Desktop**: Windows, macOS, Linux
- **Web**: All modern browsers
- **Embedded**: Fuchsia

The platform detection works reliably across all platforms without external dependencies.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Changelog

### 1.0.0
- Initial release
- Zero external dependencies
- Comprehensive utility functions for data parsing and manipulation
- Full test coverage
- Complete documentation