This package provides a set of functions to validate and sanitize filenames for different operating systems.

> **Note:** This package is still in development and may not be stable. Please use with caution.

## Features

- [x] Validate filenames for Windows
- [x] Validate filenames for Linux
- [x] Validate filenames for MacOS

> **Note:** While this package strives to provide a comprehensive solution for validating filenames, it may not cover all types of file system or edge cases. Please report any issues you encounter.

## Installing

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
	legalize: ^1.0.0
```

## Usage

You can sanitize filenames by using the provided functions.

For Windows:

```dart
import 'package:legalize/legalize.dart';

void main() {
	const someFilename = 'my?<|File.txt';

	final sanitizedFilename = legalizeWindowsFilename(someFilename);
	print(sanitizedFilename); // myFile.txt
}
```

For other systems:

```dart
import 'package:legalize/legalize.dart';

void main() {
	const someFilename = 'my///File.txt';

	final sanitizedFilename = legalizePosixFilename(someFilename);
	print(sanitizedFilename); // myFile.txt
}
```

You can also validate filenames:

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

## Contributing

If you encounter any issues or have any suggestions, please open an issue. If you would like to contribute, please open a pull request. All contributions are welcome.

## Additional information

This package was inspired by the [sanitize_filename](https://pub.dev/packages/sanitize_filename) package. I created this package because I needed a more flexible solution for my use case.
