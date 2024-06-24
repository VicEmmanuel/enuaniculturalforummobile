import 'package:flutter/foundation.dart';

/// This code is defining a nullable String variable named `apiUrlHost`. It is using the
/// `bool.hasEnvironment` method to check if the environment variable `URL_HOST` is defined.

String? apiUrlHost = kDebugMode ? "enuaniculturalforum.com" : "enuaniculturalforum.com";

///Android Emulator
//   String? apiUrlHost = kDebugMode ? "192.168.43.176:8080/" : "192.168.43.176";

///IOS Emulator
// String? apiUrlHost = kDebugMode ? "127.0.0.1:8000" : "127.0.0.1:8000";