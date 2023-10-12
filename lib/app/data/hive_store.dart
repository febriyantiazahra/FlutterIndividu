import 'package:firedart/firedart.dart';
import 'package:hive_flutter/hive_flutter.dart';

///kelas HiveStore merupakan turunan dari TokenStore
class HiveStore extends TokenStore {
  ///variabel _box bertipe Box digunakan untuk menyimpan data di dalam Hive
  final Box _box;
  ///Konstruktor HiveStore._internal hanya dapat diakses dari dalam kelas itu sendiri
  HiveStore._internal(this._box);
  ///konstanta keyToken digunakan sebagai kunci untuk menyimpan token di dalam Hive
  static const keyToken = "auth_token";

  ///ini adalah method untuk membuat instance dari kelas HiveStore
  static Future<HiveStore> create() async {
    ///membuka atau membuat sebuah box di Hive dengan nama "auth_store" 
    ///dan strategi untuk melakukan kompaksi jika jumlah data yang dihapus melebihi 50
    var box = await Hive.openBox("auth_store",
        compactionStrategy: (entries, deletedEntries) => deletedEntries > 50);
    ///mengembalikan instance dari HiveStore yang baru dibuat
    return HiveStore._internal(box);
  }

  ///Override method delete dari kelas TokenStore
  ///Method ini digunkakan untuk menghapus token dari dalam Hive
  @override
  void delete() {
    _box.delete(keyToken);
  }

  ///Override method read dari kelas TokenStore
  ///Method ini digunkakan untuk membaca token yang tersimpan di dalam Hive
  @override
  Token? read() {
    return _box.get(keyToken);
  }

  ///Override method write dari kelas TokenStore
  ///Method ini digunkakan untuk menyimpan token dari dalam Hive
  @override
  void write(Token? token) {
    _box.put(keyToken, token);
  }
}
