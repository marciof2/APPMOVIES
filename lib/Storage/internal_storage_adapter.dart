abstract class InternalStorageAdapter {
  saveFav(int id);

  delFav(int id);

  Future<String?> getFav(int id);
}
