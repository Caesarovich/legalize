import 'dart:io' show Platform;

import 'package:legalize/legalize.dart';

void main() {
  // Check for all platforms
  const someFilename = 'my???File.txt';

  if (isValidFilename(someFilename)) {
    print('The filename is valid for all systems');
  }

  // Check for the current platform
  if (isValidFilename(someFilename, os: Platform.operatingSystem)) {
    print('The filename is valid for the current system');
  }
}
