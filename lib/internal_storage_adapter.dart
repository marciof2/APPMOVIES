abstract class InternalStorageAdapter {
  void saveFav(String id, String movieTitle);

  void delFav(int id);

  Future<String?> getFav(int id);
}
