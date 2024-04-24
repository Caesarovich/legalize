import 'package:legalize/legalize.dart';
import 'package:test/test.dart';

void main() {
  var nullChar = String.fromCharCode(0);
  var stringWithNull = 'IN${nullChar}BETWEEN';
  test('Check NULL character', () {
    expect(containsNullCharacter('NoNull'), isFalse);
    expect(containsNullCharacter(stringWithNull), isTrue);
  });

  test('Check Windows illegal characters', () {
    expect(containsIllegalWindowsCharacters('Windows'), isFalse);
    expect(containsIllegalWindowsCharacters('Windows<'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows>'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows"'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows/'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows\\'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows|'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows?'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows*'), isTrue);
    expect(containsIllegalWindowsCharacters('Windows:'), isTrue);
  });

  test('Check Windows reserved file names', () {
    expect(isReservedWindowsFilename('Windows'), isFalse);
    expect(isReservedWindowsFilename('con'), isTrue);
    expect(isReservedWindowsFilename('prn'), isTrue);
    expect(isReservedWindowsFilename('aux'), isTrue);
    expect(isReservedWindowsFilename('nul'), isTrue);
    expect(isReservedWindowsFilename('com1'), isTrue);
    expect(isReservedWindowsFilename('com2'), isTrue);
    expect(isReservedWindowsFilename('com3'), isTrue);
    expect(isReservedWindowsFilename('com4'), isTrue);
    expect(isReservedWindowsFilename('com5'), isTrue);
    expect(isReservedWindowsFilename('com6'), isTrue);
    expect(isReservedWindowsFilename('com7'), isTrue);
    expect(isReservedWindowsFilename('com8'), isTrue);
    expect(isReservedWindowsFilename('com9'), isTrue);
    expect(isReservedWindowsFilename('lpt1'), isTrue);
    expect(isReservedWindowsFilename('lpt2'), isTrue);
    expect(isReservedWindowsFilename('lpt3'), isTrue);
    expect(isReservedWindowsFilename('lpt4'), isTrue);
    expect(isReservedWindowsFilename('lpt5'), isTrue);
    expect(isReservedWindowsFilename('lpt6'), isTrue);
    expect(isReservedWindowsFilename('lpt7'), isTrue);
    expect(isReservedWindowsFilename('lpt8'), isTrue);
    expect(isReservedWindowsFilename('lpt9'), isTrue);
  });

  test('Check Windows reserved file names with extensions', () {
    expect(isReservedWindowsFilename('Windows'), isFalse);
    expect(isReservedWindowsFilename('con.txt'), isTrue);
    expect(isReservedWindowsFilename('prn.txt'), isTrue);
    expect(isReservedWindowsFilename('aux.txt'), isTrue);
    expect(isReservedWindowsFilename('nul.txt'), isTrue);
    expect(isReservedWindowsFilename('com1.txt'), isTrue);
    expect(isReservedWindowsFilename('com2.txt'), isTrue);
    expect(isReservedWindowsFilename('com3.txt'), isTrue);
    expect(isReservedWindowsFilename('com4.txt'), isTrue);
    expect(isReservedWindowsFilename('com5.txt'), isTrue);
    expect(isReservedWindowsFilename('com6.txt'), isTrue);
    expect(isReservedWindowsFilename('com7.txt'), isTrue);
    expect(isReservedWindowsFilename('com8.txt'), isTrue);
    expect(isReservedWindowsFilename('com9.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt1.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt2.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt3.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt4.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt5.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt6.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt7.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt8.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt9.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt9 .txt'), isFalse);
  });

  test('Check Windows trailing characters', () {
    expect(containsIllegalWindowsTrailingCharacters('NoTrailing'), isFalse);
    expect(containsIllegalWindowsTrailingCharacters('Trailing.'), isTrue);
    expect(containsIllegalWindowsTrailingCharacters('Trailing '), isTrue);
  });

  test('Check Posix illegal characters', () {
    expect(containsIllegalPosixCharacters('Posix'), isFalse);
    expect(containsIllegalPosixCharacters('Posix/'), isTrue);
  });

  test('Check illegal length', () {
    expect(isLegalLength('Short'), isTrue);
    expect(isLegalLength('A' * 255), isTrue);
    expect(isLegalLength('A' * 256), isFalse);
    expect(isLegalLength(''), isFalse);
  });

  test("Check Windows filename", () {
    expect(isValidWindowsFilename('Windows'), isTrue);
    expect(isValidWindowsFilename('Windows<'), isFalse);
    expect(isValidWindowsFilename('con'), isFalse);
    expect(isValidWindowsFilename(stringWithNull), isFalse);
    expect(isValidWindowsFilename('A' * 256), isFalse);
    expect(isValidWindowsFilename('Windows🚀'), isTrue);
  });

  test("Check Posix filename", () {
    expect(isValidPosixFilename('Posix'), isTrue);
    expect(isValidPosixFilename('Posix<'), isTrue);
    expect(isValidPosixFilename('Posix/'), isFalse);
    expect(isValidPosixFilename(stringWithNull), isFalse);
    expect(isValidPosixFilename('A' * 256), isFalse);
    expect(isValidPosixFilename('Posix🚀'), isTrue);
  });
}
