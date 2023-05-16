import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
export 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  final SharedPreferences _sharedPrefs;
  CacheHelper(this._sharedPrefs);

  T? get<T>(String key);

  void put<T>(String key, T value);

  void remove(String key);

  bool has(String key);

  SharedPreferences get sharedPrefs => _sharedPrefs;
}

class CacheImpl extends CacheHelper {
  CacheImpl(super.sharedPrefs);

  @override
  T? get<T>(String key) {
    if (!has(key)) return null;
    return jsonDecode(sharedPrefs.getString(key)!) as T?;
  }

  @override
  void put<T>(String key, T value) =>
      _sharedPrefs.setString(key, jsonEncode(value));

  @override
  void remove(String key) => _sharedPrefs.remove(key);

  @override
  bool has(String key) => _sharedPrefs.containsKey(key);
}
