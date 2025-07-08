import 'package:dart_data_parser/dart_data_parser.dart';

void main() {
  print('=== Dart Data Parser Example ===\n');

  // Type conversions
  print('--- Type Conversions ---');
  print('getInt("123"): ${dataParser.getInt("123")}');
  print('getInt(true): ${dataParser.getInt(true)}');
  print('getInt(null): ${dataParser.getInt(null)}');
  print('getDouble("12.34"): ${dataParser.getDouble("12.34")}');
  print('getBool("true"): ${dataParser.getBool("true")}');
  print('getString(123): ${dataParser.getString(123)}');
  print('getString(null): "${dataParser.getString(null)}"');

  print('\n--- String Manipulation ---');
  print('uCFirst("hello"): ${dataParser.uCFirst("hello")}');
  print(
      'strToTitleCase("hello world"): ${dataParser.strToTitleCase("hello world")}');
  print(
      'getStringTransformed("rejected"): ${dataParser.getStringTransformed("rejected")}');
  print(
      'getUrlString("hello world"): ${dataParser.getUrlString("hello world")}');
  print(
      'getFirstWordFromString("Hello World"): ${dataParser.getFirstWordFromString("Hello World")}');
  print(
      'getTwoWordFromString("Hello World Test"): ${dataParser.getTwoWordFromString("Hello World Test")}');

  print('\n--- Data Validation ---');
  print(
      'isValidEmail("user@example.com"): ${dataParser.isValidEmail("user@example.com")}');
  print(
      'isValidEmail("invalid-email"): ${dataParser.isValidEmail("invalid-email")}');
  print('isDouble("12.34"): ${dataParser.isDouble("12.34")}');
  print('isDouble("abc"): ${dataParser.isDouble("abc")}');

  print('\n--- Encoding/Decoding ---');
  String originalText = "Hello World";
  String encoded = dataParser.base64Encoder(originalText);
  String decoded = dataParser.base64Decoder(encoded);
  print('Original: $originalText');
  print('Base64 Encoded: $encoded');
  print('Decoded: $decoded');

  Map<String, dynamic> testMap = {"name": "John", "age": 30};
  String jsonString = dataParser.encodeMap(testMap);
  Map<String, dynamic> decodedMap = dataParser.decodeMap(jsonString);
  print('Map to JSON: $jsonString');
  print('JSON to Map: $decodedMap');

  print('\n--- Mathematical Operations ---');
  // Distance between New York and Los Angeles
  double distance = dataParser.calculateDistance(
      40.7128, // New York latitude
      -74.0060, // New York longitude
      34.0522, // Los Angeles latitude
      -118.2437 // Los Angeles longitude
      );
  print('Distance NY to LA: ${distance.toStringAsFixed(2)} km');

  print('Random number (0-9999): ${dataParser.generateRandomNumber()}');
  print('Random string (length 10): ${dataParser.getRandString(10)}');
  print('Random alphanumeric (length 8): ${dataParser.genRandString(8)}');

  print('\n--- File Operations ---');
  print(
      'File extension of "document.pdf": ${dataParser.getFileExtension("document.pdf")}');
  print('Format 1024 bytes: ${dataParser.formatBytes(1024, 2)}');
  print('Format 1048576 bytes: ${dataParser.formatBytes(1048576, 1)}');
  print('Format 1073741824 bytes: ${dataParser.formatBytes(1073741824, 2)}');

  print('\n--- Utility Functions ---');
  print(
      'getDashsForNullString(null): "${dataParser.getDashsForNullString(null)}"');
  print(
      'getDashsForNullString("text"): "${dataParser.getDashsForNullString("text")}"');
  print(
      'getDashFromString("hello-world_test"): "${dataParser.getDashFromString("hello-world_test")}"');

  print('\n--- Platform Detection ---');
  print('Current platform: ${dataParser.getPlatform()}');
  print('Current OS: ${dataParser.getOs()}');
  print('Is mobile: ${dataParser.isMobile()}');
  print('Is desktop: ${dataParser.isDesktop()}');
  print('Is web: ${dataParser.isWeb()}');
  print('Is Android: ${dataParser.isAndroid()}');
  print('Is iOS: ${dataParser.isIOS()}');
  print('Is Windows: ${dataParser.isWindows()}');
  print('Is macOS: ${dataParser.isMacOS()}');
  print('Is Linux: ${dataParser.isLinux()}');

  print('\n=== Example Complete ===');
}
