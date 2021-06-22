import 'package:appmovie/Storage/internal_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends InternalStorageAdapter {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  bool? isFavorite = false;
  saveFav(id) async {
    print('FILME $id FAVORITADO');
    await secureStorage.write(key: id.toString(), value: id.toString());
  }

  delFav(id) {
    secureStorage.delete(key: id.toString());
    print('DEL FAV $id');
  }

  Future<String?> getFav(id) async {
    await secureStorage.read(key: id.toString());
  }
}
