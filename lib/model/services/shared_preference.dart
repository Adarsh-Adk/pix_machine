import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences _instance;

  static init() async {
    _instance = await SharedPreferences.getInstance();
    _token = await getToken();
  }

  static String _tokenKey = "Token";
  static String _token = "";

  static bool get isLoggedIn => !(_token == "");
  static String get token => "Bearer $_token";

  static saveToken(String tokenVal) async {
    return Future.value(
        [await _instance.setString(_tokenKey, tokenVal), await getToken()]);
  }

  static getToken() {
    _token = _instance.getString(_tokenKey) ?? "";
    return _token;
  }

  static removeToken() async {
    final a = await _instance.remove(_tokenKey);
    if (a) {
      _token = "";
    }
    return a;
  }
}
