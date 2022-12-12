import 'package:flutter_line_sdk/flutter_line_sdk.dart';

class User {
  late UserProfile currentUserProfile;
  late String currentUserEmail;
  late StoredAccessToken currentAccessToken;

  setUserProfile(UserProfile userProfile) {
    currentUserProfile = userProfile;
  }

  getUserProfile() async {
    final currentUserProfile = await LineSDK.instance.getProfile();
    return currentUserProfile;
  }

  setUserEmail(String userEmail) {
    currentUserEmail = userEmail;
  }

  getUserEmail() async {
    final result = await LineSDK.instance.login();
    final accessToken = await LineSDK.instance.currentAccessToken;
    final userEmail = result.accessToken.email;
    return userEmail;
  }

  setAccessToken(StoredAccessToken accessToken) {
    currentAccessToken = accessToken;
  }

  getAccessToken() async {
    final accessToken = await LineSDK.instance.currentAccessToken;
    return accessToken;
  }
}
