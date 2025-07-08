import 'dart:convert';
import 'dart:math';
import 'dart:io' show Platform;

/// A comprehensive utility library for parsing and transforming data types in Dart.
///
/// This library provides various methods for:
/// - Type conversions (int, double, bool, string)
/// - String manipulations and formatting
/// - Date parsing
/// - Distance calculations
/// - Email validation
/// - Random string generation
/// - Base64 encoding/decoding
/// - File operations
/// - And many more utility functions
class DartDataParser {
  /// Checks if a string can be parsed as a double
  bool isDouble(String input) {
    double? parsedDouble = double.tryParse(input);
    return parsedDouble != null;
  }

  /// Converts dynamic input to integer, returns 0 if null or empty
  int getInt(dynamic number) {
    if (number != null && number != "") {
      if (number is String) {
        return int.tryParse(number) ?? 0;
      } else if (number is bool) {
        return number ? 1 : 0;
      }
      return number;
    }
    return 0;
  }

  /// Converts dynamic input to integer, returns -1 if null or empty
  int getIntDefaultNegative(dynamic number) {
    if (number != null && number != "") {
      if (number is String) {
        return int.tryParse(number) ?? -1;
      } else if (number is bool) {
        return number ? 1 : -1;
      }
      return number;
    }
    return -1;
  }

  /// Converts dynamic input to double, returns 0.0 if null or empty
  double getDouble(dynamic number) {
    return (number == null || number == "") ? 0.0 : double.parse('$number');
  }

  /// Converts dynamic input to boolean
  bool getBool(dynamic d) {
    if (d is String) {
      return (d == 'true' || d == 'yes' || d == '1') ? true : false;
    } else if (d is int) {
      return d == 1 ? true : false;
    } else if (d is bool) {
      return d;
    }
    return false;
  }

  /// Converts dynamic input to string, returns empty string if null
  String getString(dynamic string) {
    return (string != null) ? "$string" : "";
  }

  /// Converts input to List<dynamic>, returns empty list if not a list
  List<dynamic> getDynamicList(dynamic data) {
    return (data is List<dynamic>) ? data : [];
  }

  /// Converts input to Map<dynamic, dynamic>, returns empty map if not a map
  Map<dynamic, dynamic> getDynamicMap(dynamic data) {
    return (data is Map<dynamic, dynamic>) ? data : {};
  }

  /// Converts Map<String, dynamic> to Map<dynamic, dynamic>
  Map<dynamic, dynamic> getStringDynamicMap(Map<String, dynamic> data) {
    return (data is Map<String, dynamic>) ? data : {};
  }

  /// Converts Map<dynamic, dynamic> to Map<String, dynamic>
  Map<String, dynamic> getMap(Map<dynamic, dynamic> data) {
    return (data is Map<String, dynamic>) ? data : {};
  }

  /// Converts dynamic input to DateTime, returns current time if null
  DateTime getDate(dynamic string) {
    return (string != null) ? DateTime.parse(string) : DateTime.now();
  }

  /// Capitalizes the first character of a string
  String uCFirst(String value) {
    if (value.isNotEmpty) {
      return value[0].toUpperCase() + value.substring(1);
    }
    return '';
  }

  /// Returns a character if string is not null/empty, otherwise returns empty string
  String getCharForNullString(String? str, {String chr = ','}) {
    return (str != null && str != "") ? chr : '';
  }

  /// Returns string if not null/empty, otherwise returns dashes
  String getDashsForNullString(String? str) {
    return (str != null && str != "") ? str : "---";
  }

  /// URL encodes spaces in a string
  String getUrlString(String imgStr) {
    return imgStr.replaceAll(" ", "%20");
  }

  /// Replaces dashes and underscores with spaces
  String getDashFromString(String imgStr) {
    imgStr = imgStr.replaceAll("-", " ");
    return imgStr.replaceAll("_", " ");
  }

  /// Generates a random number between 0 and 9999
  int generateRandomNumber() {
    var random = Random();
    return random.nextInt(10000);
  }

  /// Calculates distance between two coordinates using Haversine formula
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  /// Validates email format using regex
  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  /// Generates a random string of specified length using secure random
  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  /// Encodes string to base64
  String base64Encoder(String data) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.encode(data);
  }

  /// Decodes base64 string
  String base64Decoder(String base64Encoded) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    return stringToBase64.decode(base64Encoded);
  }

  /// Encodes map to base64 string
  String mapToBase64Encoder(Map<String, dynamic> map) {
    return base64Encoder(map.toString());
  }

  /// Capitalizes first letter and lowercases the rest
  String toCapitalized(String str) => str.isNotEmpty
      ? '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}'
      : '';

  /// Converts string to title case
  String strToTitleCase(String str) {
    if (str.isEmpty) return '';
    return str.replaceAllMapped(RegExp(r'\b\w+\b'), (match) {
      return toCapitalized(match.group(0)!);
    });
  }

  /// Encodes map to JSON string
  String encodeMap(Map<String, dynamic> map) {
    return json.encode(map);
  }

  /// Decodes JSON string to map
  Map<String, dynamic> decodeMap(String map) {
    return json.decode(map);
  }

  /// Encodes all values in a map to base64
  Map<String, String> encodeBase64Value(Map<String, dynamic> map) {
    Map<String, String> t = {};
    map.forEach((key, value) {
      t[key] = base64Encoder(value.toString());
    });
    return t;
  }

  /// Decodes all base64 values in a map
  Map<String, String> decodeBase64Value(Map<String, dynamic> map) {
    Map<String, String> t = {};
    map.forEach((key, value) {
      t[key] = base64Decoder(value.toString());
    });
    return t;
  }

  /// Decodes base64 string to map with error handling
  Map<String, dynamic> base64StringToMapDecoder(String base64Encoded) {
    try {
      return json.decode(base64Decoder(base64Encoded));
    } catch (e) {
      return {};
    }
  }

  /// Capitalizes first character of a string
  String getCapitalizeFirst(String string) {
    if (string.isNotEmpty) {
      return "${string[0].toUpperCase()}${string.substring(1)}";
    }
    return string;
  }

  /// Transforms string with special handling for 'rejected' -> 'Declined'
  String getStringTransformed(String string) {
    if (string.isNotEmpty) {
      return string.toLowerCase() == 'rejected'
          ? 'Declined'
          : "${string[0].toUpperCase()}${string.substring(1)}";
    }
    return string;
  }

  /// Extracts file extension from filename
  String getFileExtension(String fileName) {
    return fileName.split('.').last;
  }

  /// Gets first word from string using specified delimiter
  String getFirstWordFromString(String str, {String split = ' '}) {
    int startIndex = 0, indexOfSpace;
    indexOfSpace = str.indexOf(split, startIndex);
    if (indexOfSpace == -1) {
      return str;
    }
    startIndex = indexOfSpace + 1;
    return str.substring(0, indexOfSpace);
  }

  /// Gets first two words from string
  String getTwoWordFromString(String str) {
    List<String> splitted = str.split(' ');
    if (splitted.length < 2) {
      return str;
    }
    return "${splitted[0]} ${splitted[1]}";
  }

  /// Formats bytes to human readable format
  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// Generates random string with alphanumeric characters
  String genRandString(int length) {
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    final StringBuffer sb = StringBuffer();
    for (int i = 0; i < length; i++) {
      final randomIndex = random.nextInt(chars.length);
      sb.write(chars[randomIndex]);
    }
    return sb.toString();
  }

  /// Gets the current platform as a string
  /// Returns: 'android', 'ios', 'web', 'windows', 'macos', 'linux', 'fuchsia', or 'unknown'
  String getPlatform() {
    if (identical(0, 0.0)) {
      // This is a web check that works across all platforms
      return 'web';
    }

    try {
      if (Platform.isAndroid) return 'android';
      if (Platform.isIOS) return 'ios';
      if (Platform.isWindows) return 'windows';
      if (Platform.isMacOS) return 'macos';
      if (Platform.isLinux) return 'linux';
      if (Platform.isFuchsia) return 'fuchsia';
    } catch (e) {
      // Platform class is not available on web
      return 'web';
    }

    return 'unknown';
  }

  /// Gets the current operating system as an enum-like string
  /// Returns platform-specific constants or 'UNKNOWN'
  String getOs() {
    String platform = getPlatform();

    switch (platform) {
      case 'android':
        return 'ANDROID';
      case 'ios':
        return 'IOS';
      case 'web':
        return 'WEB';
      case 'windows':
        return 'WINDOWS';
      case 'macos':
        return 'MACOS';
      case 'linux':
        return 'LINUX';
      case 'fuchsia':
        return 'FUCHSIA';
      default:
        return 'UNKNOWN';
    }
  }

  /// Checks if the current platform is mobile (Android or iOS)
  bool isMobile() {
    String platform = getPlatform();
    return platform == 'android' || platform == 'ios';
  }

  /// Checks if the current platform is desktop (Windows, macOS, or Linux)
  bool isDesktop() {
    String platform = getPlatform();
    return platform == 'windows' || platform == 'macos' || platform == 'linux';
  }

  /// Checks if the current platform is web
  bool isWeb() {
    return getPlatform() == 'web';
  }

  /// Checks if the current platform is Android
  bool isAndroid() {
    return getPlatform() == 'android';
  }

  /// Checks if the current platform is iOS
  bool isIOS() {
    return getPlatform() == 'ios';
  }

  /// Checks if the current platform is Windows
  bool isWindows() {
    return getPlatform() == 'windows';
  }

  /// Checks if the current platform is macOS
  bool isMacOS() {
    return getPlatform() == 'macos';
  }

  /// Checks if the current platform is Linux
  bool isLinux() {
    return getPlatform() == 'linux';
  }

  /// Checks if the current platform is Fuchsia
  bool isFuchsia() {
    return getPlatform() == 'fuchsia';
  }
}

/// Global instance of DartDataParser for easy access
final DartDataParser dataParser = DartDataParser();
