import 'package:appmovie/Storage/internal_storage_adapter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends InternalStorageAdapter {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  saveFav(id) async {
    await secureStorage.write(key: id.toString(), value: id.toString());
  }

  delFav(id) {
    secureStorage.delete(key: id.toString());
  }

  Future<String?> getFav(id) async {
    return await secureStorage.read(key: id.toString());
  }
}
