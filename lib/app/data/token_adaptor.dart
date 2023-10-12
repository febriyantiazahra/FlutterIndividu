import 'package:firedart/firedart.dart';
import 'package:hive_flutter/hive_flutter.dart';

///kelas TokenAdapter merupakan turunan dari TypeAdapter<Token>
class TokenAdapter extends TypeAdapter<Token> {
  @override
  ///menentukan typeId dari kelas TokenAdapter bertipe int
  final typeId = 42;

  ///override method write digunakan untuk menulis objek token ke dalam BinaryWriter
  ///objek Token diubah menjadi Map dan ditulis ke dalam BinaryWriter
  @override
  void write(BinaryWriter writer, Token token) =>
      writer.writeMap(token.toMap());

  ///override method read digunakan untuk membaca objek Token dari dalam BinaryReader
  ///Map yang dibaca dari BinaryReader dikonversi ke objek Token
  @override
  Token read(BinaryReader reader) =>
      Token.fromMap(reader.readMap().map<String, dynamic>(
          (key, value) => MapEntry<String, dynamic>(key, value)));
}
