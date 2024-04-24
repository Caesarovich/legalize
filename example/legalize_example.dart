import 'package:legalize/legalize.dart';

void main() {
  var invalidFilename = 'my<file<.txt';
  var validFilename = 'my-file.txt';

  print('''$invalidFilename is valid on: 
      Windows: ${isValidWindowsFilename(invalidFilename) ? 'yes' : 'no'},
      Posix: ${isValidPosixFilename(invalidFilename) ? 'yes' : 'no'}''');

  print('''$validFilename is valid on:
      Windows: ${isValidWindowsFilename(validFilename) ? 'yes' : 'no'},
      Posix: ${isValidPosixFilename(validFilename) ? 'yes' : 'no'}''');

  // Output:
  // my<file<.txt is valid on:
  //     Windows: no,
  //     Posix: yes
  // my-file.txt is valid on:
  //     Windows: yes,
  //     Posix: yes
}
