import 'package:shared_preferences/shared_preferences.dart';

class CommonSharePreferences {
  static const USER_IMAGE_URL_KEY = "USER_IMAGE_URL_KEY";
  static const USER_DISPLAY_NAME_KEY = "USER_DISPLAY_NAME_KEY";
  static const ACCESS_TOKEN_KEY = "ACCESS_TOKEN_KEY";

  setUserImageUrl(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_IMAGE_URL_KEY, imageUrl);
  }

  getUserImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(USER_IMAGE_URL_KEY);
    return stringValue;
  }

  setUserDisplayName(String displayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_DISPLAY_NAME_KEY, displayName);
  }

  getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(USER_DISPLAY_NAME_KEY);
    return stringValue;
  }

  setAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESS_TOKEN_KEY, accessToken);
  }

  getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString(ACCESS_TOKEN_KEY);
    return stringValue;
  }
}
