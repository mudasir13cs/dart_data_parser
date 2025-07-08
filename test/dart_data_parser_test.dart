import 'package:dart_data_parser/dart_data_parser.dart';
import 'package:test/test.dart';

void main() {
  group('DartDataParser Tests', () {
    late DartDataParser parser;

    setUp(() {
      parser = DartDataParser();
    });

    group('Type Conversions', () {
      test('getInt should convert various types to int', () {
        expect(parser.getInt("123"), equals(123));
        expect(parser.getInt(true), equals(1));
        expect(parser.getInt(false), equals(0));
        expect(parser.getInt(null), equals(0));
        expect(parser.getInt(""), equals(0));
        expect(parser.getInt("invalid"), equals(0));
        expect(parser.getInt(456), equals(456));
      });

      test('getIntDefaultNegative should return -1 for null/empty', () {
        expect(parser.getIntDefaultNegative("123"), equals(123));
        expect(parser.getIntDefaultNegative(null), equals(-1));
        expect(parser.getIntDefaultNegative(""), equals(-1));
        expect(parser.getIntDefaultNegative("invalid"), equals(-1));
      });

      test('getDouble should convert to double', () {
        expect(parser.getDouble("12.34"), equals(12.34));
        expect(parser.getDouble(null), equals(0.0));
        expect(parser.getDouble(""), equals(0.0));
        expect(parser.getDouble(56.78), equals(56.78));
      });

      test('getBool should convert various types to bool', () {
        expect(parser.getBool("true"), isTrue);
        expect(parser.getBool("yes"), isTrue);
        expect(parser.getBool("1"), isTrue);
        expect(parser.getBool(1), isTrue);
        expect(parser.getBool(true), isTrue);
        expect(parser.getBool("false"), isFalse);
        expect(parser.getBool(0), isFalse);
        expect(parser.getBool(false), isFalse);
        expect(parser.getBool(null), isFalse);
      });

      test('getString should convert to string', () {
        expect(parser.getString(123), equals("123"));
        expect(parser.getString(null), equals(""));
        expect(parser.getString("hello"), equals("hello"));
        expect(parser.getString(true), equals("true"));
      });
    });

    group('String Manipulation', () {
      test('uCFirst should capitalize first character', () {
        expect(parser.uCFirst("hello"), equals("Hello"));
        expect(parser.uCFirst(""), equals(""));
        expect(parser.uCFirst("a"), equals("A"));
      });

      test('strToTitleCase should convert to title case', () {
        expect(parser.strToTitleCase("hello world"), equals("Hello World"));
        expect(parser.strToTitleCase(""), equals(""));
        expect(parser.strToTitleCase("test"), equals("Test"));
      });

      test('getStringTransformed should handle special cases', () {
        expect(parser.getStringTransformed("rejected"), equals("Declined"));
        expect(parser.getStringTransformed("accepted"), equals("Accepted"));
        expect(parser.getStringTransformed(""), equals(""));
      });

      test('getUrlString should encode spaces', () {
        expect(parser.getUrlString("hello world"), equals("hello%20world"));
        expect(parser.getUrlString("test"), equals("test"));
      });

      test('getFirstWordFromString should extract first word', () {
        expect(parser.getFirstWordFromString("Hello World"), equals("Hello"));
        expect(parser.getFirstWordFromString("Single"), equals("Single"));
        expect(parser.getFirstWordFromString("One Two Three"), equals("One"));
      });

      test('getTwoWordFromString should extract first two words', () {
        expect(parser.getTwoWordFromString("Hello World Test"),
            equals("Hello World"));
        expect(parser.getTwoWordFromString("Single"), equals("Single"));
        expect(parser.getTwoWordFromString("One Two"), equals("One Two"));
      });
    });

    group('Data Validation', () {
      test('isValidEmail should validate email format', () {
        expect(parser.isValidEmail("user@example.com"), isTrue);
        expect(parser.isValidEmail("test.email@domain.co.uk"), isTrue);
        expect(parser.isValidEmail("invalid-email"), isFalse);
        expect(parser.isValidEmail("@example.com"), isFalse);
        expect(parser.isValidEmail("user@"), isFalse);
        expect(parser.isValidEmail(""), isFalse);
      });

      test('isDouble should check if string is valid double', () {
        expect(parser.isDouble("12.34"), isTrue);
        expect(parser.isDouble("123"), isTrue);
        expect(parser.isDouble("abc"), isFalse);
        expect(parser.isDouble("12.34.56"), isFalse);
      });
    });

    group('Encoding/Decoding', () {
      test('base64Encoder and base64Decoder should work correctly', () {
        String original = "Hello World";
        String encoded = parser.base64Encoder(original);
        String decoded = parser.base64Decoder(encoded);
        expect(decoded, equals(original));
      });

      test('encodeMap and decodeMap should work with JSON', () {
        Map<String, dynamic> original = {"name": "John", "age": 30};
        String encoded = parser.encodeMap(original);
        Map<String, dynamic> decoded = parser.decodeMap(encoded);
        expect(decoded["name"], equals("John"));
        expect(decoded["age"], equals(30));
      });
    });

    group('Mathematical Operations', () {
      test('calculateDistance should calculate distance between coordinates',
          () {
        double distance = parser.calculateDistance(0, 0, 0, 1);
        expect(distance, greaterThan(0));
        expect(distance, lessThan(200)); // Should be around 111km
      });

      test('generateRandomNumber should generate number between 0-9999', () {
        int randomNum = parser.generateRandomNumber();
        expect(randomNum, greaterThanOrEqualTo(0));
        expect(randomNum, lessThan(10000));
      });

      test('getRandString should generate random string', () {
        String randomStr = parser.getRandString(10);
        expect(randomStr.length, greaterThan(0));
        // Should generate different strings
        String randomStr2 = parser.getRandString(10);
        expect(randomStr, isNot(equals(randomStr2)));
      });

      test('genRandString should generate alphanumeric string', () {
        String randomStr = parser.genRandString(8);
        expect(randomStr.length, equals(8));
        expect(RegExp(r'^[0-9A-Z]+').hasMatch(randomStr), isTrue);
      });
    });

    group('File Operations', () {
      test('getFileExtension should extract file extension', () {
        expect(parser.getFileExtension("document.pdf"), equals("pdf"));
        expect(parser.getFileExtension("image.jpg"), equals("jpg"));
        expect(parser.getFileExtension("file.tar.gz"), equals("gz"));
        expect(parser.getFileExtension("noextension"), equals("noextension"));
      });

      test('formatBytes should format bytes to human readable', () {
        expect(parser.formatBytes(0, 2), equals("0 B"));
        expect(parser.formatBytes(1024, 2), equals("1.00 KB"));
        expect(parser.formatBytes(1048576, 1), equals("1.0 MB"));
        expect(parser.formatBytes(1073741824, 2), equals("1.00 GB"));
      });
    });

    group('Utility Functions', () {
      test('getDashsForNullString should handle null strings', () {
        expect(parser.getDashsForNullString(null), equals("---"));
        expect(parser.getDashsForNullString(""), equals("---"));
        expect(parser.getDashsForNullString("text"), equals("text"));
      });

      test('getCharForNullString should return char for non-null strings', () {
        expect(parser.getCharForNullString("text"), equals(","));
        expect(parser.getCharForNullString("text", chr: ";"), equals(";"));
        expect(parser.getCharForNullString(null), equals(""));
        expect(parser.getCharForNullString(""), equals(""));
      });

      test('getDashFromString should replace dashes and underscores', () {
        expect(parser.getDashFromString("hello-world_test"),
            equals("hello world test"));
        expect(parser.getDashFromString("no-dashes"), equals("no dashes"));
        expect(parser.getDashFromString("with_underscores"),
            equals("with underscores"));
      });

      test('getDynamicList should safely convert to list', () {
        List<dynamic> testList = [1, 2, 3];
        expect(parser.getDynamicList(testList), equals(testList));
        expect(parser.getDynamicList("not a list"), equals([]));
        expect(parser.getDynamicList(null), equals([]));
      });

      test('getDynamicMap should safely convert to map', () {
        Map<dynamic, dynamic> testMap = {"key": "value"};
        expect(parser.getDynamicMap(testMap), equals(testMap));
        expect(parser.getDynamicMap("not a map"), equals({}));
        expect(parser.getDynamicMap(null), equals({}));
      });

      test('getDate should parse date or return current time', () {
        DateTime testDate = DateTime.parse("2023-01-01");
        expect(parser.getDate("2023-01-01"), equals(testDate));

        DateTime currentTime = parser.getDate(null);
        expect(currentTime, isA<DateTime>());
      });

      test('toCapitalized should capitalize and lowercase rest', () {
        expect(parser.toCapitalized("HELLO"), equals("Hello"));
        expect(parser.toCapitalized("hello"), equals("Hello"));
        expect(parser.toCapitalized(""), equals(""));
      });

      test('base64StringToMapDecoder should handle errors gracefully', () {
        // Test with invalid base64
        Map<String, dynamic> result =
            parser.base64StringToMapDecoder("invalid_base64");
        expect(result, equals({}));

        // Test with valid base64 that decodes to valid JSON
        String validJson = '{"key": "value"}';
        String base64Json = parser.base64Encoder(validJson);
        Map<String, dynamic> decoded =
            parser.base64StringToMapDecoder(base64Json);
        expect(decoded, isA<Map<String, dynamic>>());
        expect(decoded["key"], equals("value"));

        // Test with valid base64 that decodes to invalid JSON
        String invalidJson = 'not valid json';
        String base64Invalid = parser.base64Encoder(invalidJson);
        Map<String, dynamic> decodedInvalid =
            parser.base64StringToMapDecoder(base64Invalid);
        expect(decodedInvalid, equals({}));
      });

      test('encodeBase64Value should encode all map values', () {
        Map<String, dynamic> testMap = {"key1": "value1", "key2": "value2"};
        Map<String, String> encoded = parser.encodeBase64Value(testMap);

        expect(encoded.keys, equals(testMap.keys));
        expect(parser.base64Decoder(encoded["key1"]!), equals("value1"));
        expect(parser.base64Decoder(encoded["key2"]!), equals("value2"));
      });

      test('decodeBase64Value should decode all map values', () {
        Map<String, dynamic> testMap = {
          "key1": parser.base64Encoder("value1"),
          "key2": parser.base64Encoder("value2")
        };
        Map<String, String> decoded = parser.decodeBase64Value(testMap);

        expect(decoded["key1"], equals("value1"));
        expect(decoded["key2"], equals("value2"));
      });
    });

    group('Platform Detection', () {
      test('getPlatform should return valid platform string', () {
        String platform = parser.getPlatform();
        List<String> validPlatforms = [
          'android',
          'ios',
          'web',
          'windows',
          'macos',
          'linux',
          'fuchsia',
          'unknown'
        ];
        expect(validPlatforms.contains(platform), isTrue);
      });

      test('getOs should return valid OS string', () {
        String os = parser.getOs();
        List<String> validOSes = [
          'ANDROID',
          'IOS',
          'WEB',
          'WINDOWS',
          'MACOS',
          'LINUX',
          'FUCHSIA',
          'UNKNOWN'
        ];
        expect(validOSes.contains(os), isTrue);
      });

      test('platform check methods should return boolean', () {
        expect(parser.isMobile(), isA<bool>());
        expect(parser.isDesktop(), isA<bool>());
        expect(parser.isWeb(), isA<bool>());
        expect(parser.isAndroid(), isA<bool>());
        expect(parser.isIOS(), isA<bool>());
        expect(parser.isWindows(), isA<bool>());
        expect(parser.isMacOS(), isA<bool>());
        expect(parser.isLinux(), isA<bool>());
        expect(parser.isFuchsia(), isA<bool>());
      });

      test(
          'platform checks should be mutually exclusive for specific platforms',
          () {
        // Only one specific platform should be true
        List<bool> platformChecks = [
          parser.isAndroid(),
          parser.isIOS(),
          parser.isWindows(),
          parser.isMacOS(),
          parser.isLinux(),
          parser.isFuchsia()
        ];

        // Either exactly one is true, or none (for web or unknown)
        int trueCount = platformChecks.where((check) => check).length;
        expect(trueCount, lessThanOrEqualTo(1));
      });

      test('mobile and desktop should be mutually exclusive', () {
        bool mobile = parser.isMobile();
        bool desktop = parser.isDesktop();
        bool web = parser.isWeb();

        // Only one category should be true
        List<bool> categories = [mobile, desktop, web];
        int trueCount = categories.where((check) => check).length;
        expect(trueCount, lessThanOrEqualTo(1));
      });
    });

    group('Global Instance', () {
      test('dataParser global instance should work', () {
        expect(dataParser.getInt("123"), equals(123));
        expect(dataParser.getString("test"), equals("test"));
        expect(dataParser.isValidEmail("test@example.com"), isTrue);
      });
    });
  });
}
