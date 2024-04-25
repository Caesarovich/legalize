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
    expect(isReservedWindowsFilename('con.png'), isTrue);
    expect(isReservedWindowsFilename('prn.jpg'), isTrue);
    expect(isReservedWindowsFilename('aux.png'), isTrue);
    expect(isReservedWindowsFilename('nul.jpg'), isTrue);
    expect(isReservedWindowsFilename('com1.png'), isTrue);
    expect(isReservedWindowsFilename('com2.jpg'), isTrue);
    expect(isReservedWindowsFilename('com3.png'), isTrue);
    expect(isReservedWindowsFilename('com4.jpg'), isTrue);
    expect(isReservedWindowsFilename('com5.png'), isTrue);
    expect(isReservedWindowsFilename('com6.jpg'), isTrue);
    expect(isReservedWindowsFilename('com7.png'), isTrue);
    expect(isReservedWindowsFilename('com8.jpg'), isTrue);
    expect(isReservedWindowsFilename('com9.png'), isTrue);
    expect(isReservedWindowsFilename('lpt1.jpg'), isTrue);
    expect(isReservedWindowsFilename('lpt2.png'), isTrue);
    expect(isReservedWindowsFilename('lpt3.jpg'), isTrue);
    expect(isReservedWindowsFilename('lpt4.png'), isTrue);
    expect(isReservedWindowsFilename('lpt5.jpg'), isTrue);
    expect(isReservedWindowsFilename('lpt6.png'), isTrue);
    expect(isReservedWindowsFilename('lpt7.jpg'), isTrue);
    expect(isReservedWindowsFilename('lpt8.png'), isTrue);
    expect(isReservedWindowsFilename('lpt9.jpg'), isTrue);
    expect(isReservedWindowsFilename('lpt9 .png'), isFalse);
    expect(isReservedWindowsFilename('lpt9.mp3'), isTrue);
    expect(isReservedWindowsFilename('lpt9.gif'), isTrue);
    expect(isReservedWindowsFilename('lpt9.pdf'), isTrue);
    expect(isReservedWindowsFilename('lpt9.docx'), isTrue);
    expect(isReservedWindowsFilename('lpt9.xlsx'), isTrue);
    expect(isReservedWindowsFilename('lpt9.pptx'), isTrue);
    expect(isReservedWindowsFilename('lpt9.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt9.png'), isTrue);
    expect(isReservedWindowsFilename('lpt9.jpg'), isTrue);
    expect(isReservedWindowsFilename('lpt9.mp4'), isTrue);
    expect(isReservedWindowsFilename('lpt9.avi'), isTrue);
    expect(isReservedWindowsFilename('lpt9.so'), isTrue);
    expect(isReservedWindowsFilename('lpt9.o'), isTrue);
    expect(isReservedWindowsFilename('lpt9.a'), isTrue);
    expect(isReservedWindowsFilename('lpt9.out'), isTrue);
    expect(isReservedWindowsFilename('lpt9.log'), isTrue);
    expect(isReservedWindowsFilename('lpt9.tmp'), isTrue);
    expect(isReservedWindowsFilename('lpt9.bak'), isTrue);
    expect(isReservedWindowsFilename('lpt9.bak.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt9.tmp.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt9.log.txt'), isTrue);
    expect(isReservedWindowsFilename('lpt9.out.txt'), isTrue);
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

  test("Sanitize Windows filename", () {
    expect(legalizeWindowsFilename('Windows'), equals('Windows'));
    expect(legalizeWindowsFilename('Windows<'), equals('Windows_'));
    expect(legalizeWindowsFilename('con'), equals('_'));
    expect(legalizeWindowsFilename('con.txt'), equals('_.txt'));
    expect(legalizeWindowsFilename(stringWithNull), equals('IN_BETWEEN'));
    expect(legalizeWindowsFilename('Windows\u0001Windows'),
        equals('Windows_Windows'));
    expect(legalizeWindowsFilename('Windows\u0010Windows'),
        equals('Windows_Windows'));
    expect(legalizeWindowsFilename('Windows\u001fWindows'),
        equals('Windows_Windows'));
    expect(legalizeWindowsFilename('Windows\u0020Windows'),
        equals('Windows Windows'));
    expect(legalizeWindowsFilename('A' * 256), equals('A' * 255));
    expect(legalizeWindowsFilename('W|ndows'), equals('W_ndows'));
    expect(legalizeWindowsFilename('Windows🚀'), equals('Windows🚀'));
    expect(legalizeWindowsFilename(''), equals('untitled'));
    expect(legalizeWindowsFilename('uni<<<??co??>>>rn'),
        equals('uni_____co_____rn'));
  });

  test('Sanitize Windows filename with replacement', () {
    expect(legalizeWindowsFilename('Windows', replacement: '-'),
        equals('Windows'));
    expect(legalizeWindowsFilename('Windows<', replacement: '-'),
        equals('Windows-'));
    expect(legalizeWindowsFilename('con', replacement: '-'), equals('-'));
    expect(
        legalizeWindowsFilename('con.txt', replacement: '-'), equals('-.txt'));
    expect(legalizeWindowsFilename(stringWithNull, replacement: '-'),
        equals('IN-BETWEEN'));
    expect(legalizeWindowsFilename('Windows\u0001Windows', replacement: '-'),
        equals('Windows-Windows'));
    expect(legalizeWindowsFilename('Windows\u0010Windows', replacement: '-'),
        equals('Windows-Windows'));
    expect(legalizeWindowsFilename('Windows\u001fWindows', replacement: '-'),
        equals('Windows-Windows'));
    expect(legalizeWindowsFilename('A' * 256, replacement: '-'),
        equals('A' * 255));
    expect(legalizeWindowsFilename('W|ndows', replacement: '-'),
        equals('W-ndows'));
    expect(legalizeWindowsFilename('Windows🚀', replacement: '-'),
        equals('Windows🚀'));
    expect(legalizeWindowsFilename('', replacement: '-'), equals('untitled'));
    expect(legalizeWindowsFilename('uni<<<??co??>>>rn', replacement: '-'),
        equals('uni-----co-----rn'));
  });

  test('Sanitize Windows filename with empty replacement', () {
    expect(
        legalizeWindowsFilename('Windows', replacement: ''), equals('Windows'));
    expect(legalizeWindowsFilename('Windows<', replacement: ''),
        equals('Windows'));
    expect(legalizeWindowsFilename('con', replacement: ''), equals('untitled'));
    expect(legalizeWindowsFilename('con.txt', replacement: ''), equals('.txt'));
    expect(
        legalizeWindowsFilename('con<.txt', replacement: ''), equals('.txt'));
    expect(legalizeWindowsFilename(stringWithNull, replacement: ''),
        equals('INBETWEEN'));
    expect(
        legalizeWindowsFilename('A' * 256, replacement: ''), equals('A' * 255));
    expect(legalizeWindowsFilename('<${'A' * 255}', replacement: ''),
        equals('A' * 254));
    expect(
        legalizeWindowsFilename('W|ndows', replacement: ''), equals('Wndows'));
    expect(legalizeWindowsFilename('Windows🚀', replacement: ''),
        equals('Windows🚀'));
    expect(legalizeWindowsFilename('', replacement: ''), equals('untitled'));
    expect(legalizeWindowsFilename('<', replacement: ''), equals('untitled'));
    expect(legalizeWindowsFilename('con', replacement: ''), equals('untitled'));
    expect(legalizeWindowsFilename('<|||con\u0000?', replacement: ''),
        equals('untitled'));
    expect(legalizeWindowsFilename('uni<<<??co??>>>rn', replacement: ''),
        equals('unicorn'));
  });

  test(
      'Sanitize Windows filename with empty replacement and custom placeholder',
      () {
    expect(
        legalizeWindowsFilename('con', replacement: '', placeholder: 'special'),
        equals('special'));
    expect(
        legalizeWindowsFilename('con.txt',
            replacement: '', placeholder: 'special'),
        equals('.txt'));
    expect(
        legalizeWindowsFilename('con<.txt',
            replacement: '', placeholder: 'special'),
        equals('.txt'));
  });

  test('Sanitize Windows filename with empty replacement and empty placeholder',
      () {
    expect(legalizeWindowsFilename('con', replacement: '', placeholder: ''),
        equals(''));
    expect(legalizeWindowsFilename('con.txt', replacement: '', placeholder: ''),
        equals('.txt'));
    expect(
        legalizeWindowsFilename('con<.txt', replacement: '', placeholder: ''),
        equals('.txt'));
  });

  test(
      'Sanitize Windows filename with empty replacement and empty placeholder and empty filename',
      () {
    expect(legalizeWindowsFilename('', replacement: '', placeholder: ''),
        equals(''));
    expect(legalizeWindowsFilename('', replacement: '', placeholder: 'special'),
        equals('special'));
    expect(legalizeWindowsFilename('', replacement: '', placeholder: 'special'),
        equals('special'));
  });

  test('Sanitize Posix filename', () {
    expect(legalizePosixFilename('Posix'), equals('Posix'));
    expect(legalizePosixFilename('Posix<'), equals('Posix<'));
    expect(legalizePosixFilename('Posix/'), equals('Posix_'));
    expect(legalizePosixFilename(stringWithNull), equals('IN_BETWEEN'));
    expect(legalizePosixFilename('Posix\u0010Posix'), equals('Posix_Posix'));
    expect(legalizePosixFilename('Posix\u0010Posix'), equals('Posix_Posix'));
    expect(legalizePosixFilename('Posix\u001fPosix'), equals('Posix_Posix'));
    expect(legalizePosixFilename('Posix\u0020Posix'), equals('Posix Posix'));
    expect(legalizePosixFilename('A' * 256), equals('A' * 255));
    expect(legalizePosixFilename('P/six'), equals('P_six'));
    expect(legalizePosixFilename('Posix🚀'), equals('Posix🚀'));
    expect(legalizePosixFilename(''), equals('untitled'));
    expect(legalizePosixFilename('uni<<<??co??>>>rn'),
        equals('uni<<<??co??>>>rn'));
  });
  test('Sanitize Posix filename with replacement', () {
    expect(legalizePosixFilename('Posix', replacement: '-'), equals('Posix'));
    expect(legalizePosixFilename('Posix<', replacement: '-'), equals('Posix<'));
    expect(legalizePosixFilename('Posix/', replacement: '-'), equals('Posix-'));
    expect(legalizePosixFilename(stringWithNull, replacement: '-'),
        equals('IN-BETWEEN'));
    expect(legalizePosixFilename('Posix\u0001Posix', replacement: '-'),
        equals('Posix-Posix'));

    expect(legalizePosixFilename('Posix\u0010Posix', replacement: '-'),
        equals('Posix-Posix'));
    expect(legalizePosixFilename('Posix\u001fPosix', replacement: '-'),
        equals('Posix-Posix'));
    expect(
        legalizePosixFilename('A' * 256, replacement: '-'), equals('A' * 255));
    expect(legalizePosixFilename('P/six', replacement: '-'), equals('P-six'));
    expect(
        legalizePosixFilename('Posix🚀', replacement: '-'), equals('Posix🚀'));
    expect(legalizePosixFilename('', replacement: '-'), equals('untitled'));
    expect(legalizePosixFilename('uni<<<??co??>>>rn', replacement: '-'),
        equals('uni<<<??co??>>>rn'));
  });

  test('Sanitize Posix filename with empty replacement', () {
    expect(legalizePosixFilename('Posix', replacement: ''), equals('Posix'));
    expect(legalizePosixFilename('Posix<', replacement: ''), equals('Posix<'));
    expect(legalizePosixFilename('Posix/', replacement: ''), equals('Posix'));
    expect(legalizePosixFilename(stringWithNull, replacement: ''),
        equals('INBETWEEN'));
    expect(
        legalizePosixFilename('A' * 256, replacement: ''), equals('A' * 255));
    expect(legalizePosixFilename('P/six', replacement: ''), equals('Psix'));
    expect(
        legalizePosixFilename('Posix🚀', replacement: ''), equals('Posix🚀'));
    expect(legalizePosixFilename('', replacement: ''), equals('untitled'));
    expect(legalizePosixFilename('uni<<<??co??>>>rn', replacement: ''),
        equals('uni<<<??co??>>>rn'));
  });

  test('Sanitize Posix filename with empty replacement and custom placeholder',
      () {
    expect(legalizePosixFilename('/', replacement: '', placeholder: 'special'),
        equals('special'));
    expect(
        legalizePosixFilename('///', replacement: '', placeholder: 'special'),
        equals('special'));
    expect(
        legalizePosixFilename('/\u0000/',
            replacement: '', placeholder: 'special'),
        equals('special'));
  });

  test('Sanitize Posix filename with empty replacement and empty placeholder',
      () {
    expect(legalizePosixFilename('/', replacement: '', placeholder: ''),
        equals(''));
    expect(legalizePosixFilename('///', replacement: '', placeholder: ''),
        equals(''));
    expect(legalizePosixFilename('/\u0000/', replacement: '', placeholder: ''),
        equals(''));
  });

  test('Sanitize Posix filename without replacing control characters', () {
    expect(
        legalizePosixFilename('Posix', shouldReplaceControlCharacters: false),
        equals('Posix'));
    expect(
        legalizePosixFilename('Posix<', shouldReplaceControlCharacters: false),
        equals('Posix<'));
    expect(
        legalizePosixFilename('Posix/', shouldReplaceControlCharacters: false),
        equals('Posix_'));
    expect(
        legalizePosixFilename(stringWithNull,
            shouldReplaceControlCharacters: false),
        equals("IN_BETWEEN"));
    expect(
        legalizePosixFilename('Posix\u0001Posix',
            shouldReplaceControlCharacters: false),
        equals('Posix\u0001Posix'));
    expect(
        legalizePosixFilename('Posix\u0010Posix',
            shouldReplaceControlCharacters: false),
        equals('Posix\u0010Posix'));
    expect(
        legalizePosixFilename('Posix\u001fPosix',
            shouldReplaceControlCharacters: false),
        equals('Posix\u001fPosix'));
  });
}
