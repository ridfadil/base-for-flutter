import 'dart:typed_data';

import 'package:pointycastle/digests/sha512.dart';
import 'package:pointycastle/pointycastle.dart';

String sha512(text) {
  Digest sha512 = new SHA512Digest();
  var plaintText = Uint8List.fromList(text.codeUnits);
  var cipherText = sha512.process(plaintText);
  var result = formatBytesAsHexString(cipherText);
  return result;
}

String formatBytesAsHexString(Uint8List bytes) {
  var result = new StringBuffer();
  for (var i = 0; i < bytes.lengthInBytes; i++) {
    var part = bytes[i];
    result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
  }
  return result.toString();
}
