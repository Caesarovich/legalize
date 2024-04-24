This package provides a set of functions to validate and sanitize filenames for different operating systems.

> **Note:** This package is still in development and may not be stable. Please use with caution.

## Features

- [x] Validate filenames for Windows
- [x] Validate filenames for Linux
- [x] Validate filenames for MacOS

> **Note:** While this package strives to provide a comprehensive solution for validating filenames, it may not cover all types of file system or edge cases. Please report any issues you encounter.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
import 'package:legalize/legalize.dart';

void main() {
  const someFilename = 'some???Filename.txt';

  if (!isValidWindowsFilename(someFilename)) {
		print('Filename is invalid on windows');
	} else {
		print('Filename is valid on windows');
	}
}
```

## Additional information

This package was inspired by the [sanitize_filename](https://pub.dev/packages/sanitize_filename) package. I created this package because I needed a more flexible solution for my use case.
