final reservedWindowsFilenames = [
  'con',
  'prn',
  'aux',
  'nul',
  'com1',
  'com2',
  'com3',
  'com4',
  'com5',
  'com6',
  'com7',
  'com8',
  'com9',
  'lpt1',
  'lpt2',
  'lpt3',
  'lpt4',
  'lpt5',
  'lpt6',
  'lpt7',
  'lpt8',
  'lpt9'
];

/// Checks if the filename contains illegal Windows characters.
bool containsIllegalWindowsCharacters(String filename) {
  return filename.contains(RegExp(r'[<>:"/\\|?*]'));
}

/// Checks if the filename is a reserved Windows file name.
bool isReservedWindowsFilename(String filename) {
  return reservedWindowsFilenames
      .contains(filename.toLowerCase().split('.').first);
}

bool containsIllegalWindowsTrailingCharacters(String filename) {
  return filename.contains(RegExp(r'[\. ]+$'));
}

/// Checks if the filename contains illegal Posix characters.
bool containsIllegalPosixCharacters(String filename) {
  return filename.contains(RegExp(r'[/]'));
}

/// Checks if the filename contains a null character.
bool containsNullCharacter(String filename) {
  return filename.contains(String.fromCharCode(0));
}

/// Checks if the filename contains a control character.
bool containsControlCharacter(String filename) {
  return filename.contains(RegExp(r'[\x00-\x1F]'));
}

/// Checks if the filename is of valid length.
///
/// The filename must be less than or equal to 255 characters and not empty.
bool isLegalLength(String filename) {
  return filename.length <= 255 && filename.isNotEmpty;
}

/// Checks if the filename is a valid Windows filename.
///
/// This includes checking for illegal characters, reserved file names, null characters, and length.
bool isValidWindowsFilename(String filename) {
  return isLegalLength(filename) &&
      !containsIllegalWindowsCharacters(filename) &&
      !isReservedWindowsFilename(filename) &&
      !containsNullCharacter(filename);
}

/// Checks if the filename is a valid Posix filename.
///
/// This includes checking for illegal characters and length.
bool isValidPosixFilename(String filename) {
  return isLegalLength(filename) &&
      !containsIllegalPosixCharacters(filename) &&
      !containsNullCharacter(filename);
}

/// Sanitizes the filename for Windows systems.
///
/// [replacement] is used to replace illegal characters.
/// If the filename is empty after sanitization, it will be replaced with [placeholder].
/// It is recommended to not use an empty [replacement] and an empty [placeholder] as it may result in an empty filename.
String legalizeWindowsFilename(String filename,
    {String replacement = '_', String placeholder = 'untitled'}) {
  var result = filename;

  // Check length
  if (result.length > 255) {
    result = result.substring(0, 255);
  }

  // Replace null characters
  result = result.replaceAll(String.fromCharCode(0), replacement);

  // Replace control characters
  result = result.replaceAll(RegExp(r'[\x00-\x1F]'), replacement);

  // Replace illegal characters
  result = result.replaceAll(RegExp(r'[<>:"/\\|?*]'), replacement);

  // Replace trailing illegal characters
  result = result.replaceAll(RegExp(r'[\. ]+$'), replacement);

  // Replace reserved file names
  if (isReservedWindowsFilename(result)) {
    for (var reserved in reservedWindowsFilenames) {
      if (result.toLowerCase().startsWith(reserved)) {
        result = result.replaceFirst(reserved, replacement);
        break;
      }
    }
  }

  // If the filename is empty, replace it with a placeholder
  if (result.isEmpty) {
    result = placeholder;
  }

  return result;
}

/// Sanitizes the filename for Posix systems.
///
/// [replacement] is used to replace illegal characters.
/// If the filename is empty after sanitization, it will be replaced with [placeholder].
/// It is recommended to not use an empty [replacement] and an empty [placeholder] as it may result in an empty filename.
/// [shouldReplaceControlCharacters] determines whether control characters should be replaced. Default is true.
String legalizePosixFilename(String filename,
    {String replacement = '_',
    String placeholder = 'untitled',
    bool shouldReplaceControlCharacters = true}) {
  var result = filename;

  // Check length
  if (result.length > 255) {
    result = result.substring(0, 255);
  }

  // Replace null characters
  result = result.replaceAll(String.fromCharCode(0), replacement);

  // Replace control characters
  if (shouldReplaceControlCharacters) {
    result = result.replaceAll(RegExp(r'[\x00-\x1F]'), replacement);
  }

  // Replace illegal characters
  result = result.replaceAll(RegExp(r'[/]'), replacement);

  // If the filename is empty, replace it with a placeholder
  if (result.isEmpty) {
    result = placeholder;
  }

  return result;
}
