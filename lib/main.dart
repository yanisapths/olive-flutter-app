import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_theme.dart';
import 'common/app_constant.dart';
import 'firebase_options.dart';
import 'modules/home_module/list_poc.dart';
import 'modules/signin_module/signin_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FirebaseApp app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Initialized default app $app');

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  LineSDK.instance.setup('1656791451').then((_) {
    print('LineSDK Prepared');
  }).then((_) => runApp(MyApp()));
}

void initialization() async {
  // load resources
  await Future.delayed(SPLASHSCREEN_DURATION);
  // whenever initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  UserProfile? userProfile;
  String? userEmail;
  StoredAccessToken? accessToken;
  @override
  void initState() {
    super.initState();
    initialization();
    initPlatformState();
    print('main initPlatformState');
  }

  Future<void> initPlatformState() async {
    UserProfile? userProfile;
    StoredAccessToken? accessToken;
    try {
      accessToken = await LineSDK.instance.currentAccessToken;
      if (accessToken != null) {
        userProfile = await LineSDK.instance.getProfile();
      }
    } on PlatformException catch (e) {
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      userProfile = userProfile;
      accessToken = accessToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      title: 'Olive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.lightBlue,
        textTheme:
            GoogleFonts.notoSansThaiTextTheme(Theme.of(context).textTheme),
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: AppTheme.nearlyWhite,
        backgroundColor: AppTheme.nearlyWhite,
      ),
      home: userProfile == null
          ? SignInPage()
          : ScrollPoc(
              userProfile: userProfile!,
              userEmail: userEmail,
              accessToken: accessToken!,
            ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
