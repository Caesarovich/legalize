import 'package:legalize/legalize.dart';

void main() {
  // Windows
  const someFilename = 'my?<|File.txt';

  final sanitizedFilename = legalizeWindowsFilename(someFilename);
  print(sanitizedFilename); // myFile.txt

  // Others
  const someFilename2 = 'my///File.txt';

  final sanitizedFilename2 = legalizePosixFilename(someFilename2);
  print(sanitizedFilename2); // myFile.txt
}
