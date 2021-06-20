import 'package:appmovie/internal_storage_adapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternalStorage extends InternalStorageAdapter {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List listFav = [];
  bool? fav = false;
  saveFav(id, title) async {
    final internalPref = await _prefs;
    var favs = internalPref.containsKey(id);
    print(favs);
    if (favs == true) {
      internalPref.remove(id);
    } else {
      internalPref.setString(id, title);
    }
  }

  @override
  void delFav(int? id) async {
    final internalPref = await _prefs;
    await internalPref.remove(id.toString());
  }

  @override
  Future<String?> getFav(int? id) async {
    final internalPref = await _prefs;
    return internalPref.getString(id.toString());
  }
}
