# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-01-01

### Added
- Initial release of Dart Data Parser
- Type conversion methods (`getInt`, `getDouble`, `getBool`, `getString`)
- String manipulation utilities (`uCFirst`, `strToTitleCase`, `getUrlString`)
- Data validation methods (`isValidEmail`, `isDouble`)
- Base64 encoding/decoding functionality
- JSON encoding/decoding for maps
- Mathematical operations (distance calculation, random number generation)
- File operation utilities (`getFileExtension`, `formatBytes`)
- Collection safety methods (`getDynamicList`, `getDynamicMap`)
- Date parsing utilities
- **Platform detection methods for all supported platforms**
- **Cross-platform compatibility (Android, iOS, Web, Windows, macOS, Linux, Fuchsia)**
- Zero external dependencies
- Comprehensive test coverage
- Complete documentation and examples

### Features
- **Type Conversions**: Safe conversion between int, double, bool, and string types
- **String Processing**: Capitalization, title case, URL encoding, and text transformation
- **Data Validation**: Email format validation and type checking
- **Encoding/Decoding**: Base64 and JSON operations with error handling
- **Mathematical Utilities**: Haversine distance calculation and random generators
- **File Operations**: Extension extraction and human-readable byte formatting
- **Collection Safety**: Safe list and map operations with fallback values
- **Platform Detection**: Cross-platform detection for Android, iOS, Web, Windows, macOS, Linux, and Fuchsia
- **Global Instance**: Ready-to-use global `dataParser` instance

### Platform Support
- **Mobile**: Android, iOS
- **Desktop**: Windows, macOS, Linux  
- **Web**: All modern browsers
- **Embedded**: Fuchsia
- **Universal**: Works across all Dart/Flutter supported platforms

### Technical Details
- Minimum Dart SDK: 3.0.0
- Zero external dependencies
- Null-safe implementation
- Comprehensive error handling
- Full test coverage with edge cases
- Well-documented API with examples
- Cross-platform compatibility without conditional imports