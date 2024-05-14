This package provides a set of functions to validate and sanitize filenames for different operating systems.

Please read the [documentation](https://pub.dev/documentation/legalize/latest/) for more information.

> **Note:** This package is still in development and may not be stable. Please use with caution.

## Features

- ✅ Validate/Sanitize filenames for Windows
- ✅ Validate/Sanitize filenames for macOS/iOS (HFS/HFS+)
- ✅ Validate/Sanitize filenames for Linux, and other POSIX systems

> **Note:** While this package strives to provide a comprehensive solution for validating filenames, it may not cover all types of file system or edge cases. Please report any issues you encounter.

## Installing

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  legalize: ^1.1.0
```

## Usage

You can sanitize filenames by using the `legalizeFilename` function:

```dart
import 'package:legalize/legalize.dart';

void main() {
	const someFilename = 'my?/?/?File.txt';

	final sanitizedFilename = legalizeFilename(someFilename);

	print(sanitizedFilename); // myFile.txt
}
```

You can also specify the operating system to sanitize the filename for:

```dart
import 'dart:io' show Platform;

import 'package:legalize/legalize.dart';

void main() {
	const someFilename = 'my?/?/?File.txt';

	final sanitizedFilename = legalizeFilename(someFilename, os: Platform.operatingSystem);

	print(sanitizedFilename); // On Windows: my//File.txt, On other systems: my???File.txt
}
```

You can use specififc function for Windows:

```dart
import 'package:legalize/legalize.dart';

void main() {
	const someFilename = 'my?<|File.txt';

	final sanitizedFilename = legalizeWindowsFilename(someFilename);
	print(sanitizedFilename); // myFile.txt
}
```

Or for macOS/iOS:

```dart
import 'package:legalize/legalize.dart';

void main() {
	const someFilename = 'my/:/:File.txt';

	final sanitizedFilename = legalizeHFSFilename(someFilename);
	print(sanitizedFilename); // myFile.txt
}
```

Or for other systems:

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
import 'dart:io' show Platform;

import 'package:legalize/legalize.dart';

void main() {
  const someFilename = 'some???Filename.txt';

  if (!isValidFilename(someFilename, os: Platform.operatingSystem)) {
		print('Filename is invalid for this system');
	} else {
		print('Filename is valid for this system');
	}

}
```

By default this library will sanitize control characters (0-31 and 127), but you can disable this by setting the `shouldReplaceControlCharacters` parameter to `false`.

> **Note:** Even if you disable control character replacement, the library will still replace the NUL character (0).

This library also limits the length of the filename to 255 characters.

## Contributing

If you encounter any issues or have any suggestions, please open an issue. If you would like to contribute, please open a pull request. All contributions are welcome.

## Additional information

This package was inspired by the [sanitize_filename](https://pub.dev/packages/sanitize_filename) package. I created this package because I needed a more flexible solution for my use case.
