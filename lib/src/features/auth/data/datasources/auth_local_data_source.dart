import 'package:shared_preferences/shared_preferences.dart';

mixin AuthLocalDataSource {
  ///
  Future<String?> getToken();

  ///
  Future<void> saveToken(String token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPref = sharedPreferences;

  final SharedPreferences _sharedPref;

  @override
  Future<String?> getToken() async {
    final token = _sharedPref.getString('token');
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    await _sharedPref.setString('token', token);
  }
}
