/// Environment variables and shared app constants.
abstract class EnvironmentConstants {
  static const apiKey = String.fromEnvironment(
    'apiKey',
    defaultValue: "AIzaSyCBeYoTh-h9tn_JH__lrJ6HYv0ecvX0JFs",
  );
  static const appIdAndroid = String.fromEnvironment('appIdAndroid',
      defaultValue: "1:153746750887:android:03a4e7c592dc60696cca82");
  static const messagingSenderId =
      String.fromEnvironment('messagingSenderId', defaultValue: "153746750887");
  static const projectId =
      String.fromEnvironment('projectId', defaultValue: "happyelders-customer");
  static const databaseURL = String.fromEnvironment('databaseURL',
      defaultValue:
          "https://happyelders-customer-default-rtdb.asia-southeast1.firebasedatabase.app");

  //iOS
  static const iosClientId = String.fromEnvironment('iosClientId',
      defaultValue:
          "153746750887-matiskfqp2h0sg5h41p0ei445bqq9392.apps.googleusercontent.com");
  static const appIdIos = String.fromEnvironment('appIdIos',
      defaultValue: "1:153746750887:ios:de6eec1dcc06a2bb6cca82");
}
