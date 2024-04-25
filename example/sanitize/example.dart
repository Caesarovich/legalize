import 'dart:io' show Platform;

import 'package:legalize/legalize.dart';

void main() {
  // Sanitize for all platforms
  const someFilename = 'my?/?/?File.txt';

  final sanitizedFilename = legalizeFilename(someFilename);

  print(sanitizedFilename); // myFile.txt

  // Sanitize for the current platform
  const someOtherFilename = 'my?/?/?File.txt';

  final otherSanitizedFilename =
      legalizeFilename(someOtherFilename, os: Platform.operatingSystem);

  print(otherSanitizedFilename);
  // On Windows: my//File.txt, On other systems: my???File.txt
}
