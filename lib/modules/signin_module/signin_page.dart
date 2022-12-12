import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:olive/app_theme.dart';
import 'package:olive/common/share_preferences.dart';

import '../../common/app_constant.dart';
import '../../entities/daycare_entity.dart';
import '../../entities/user_profile.dart';
import '../daycare_module/daycare_theme.dart';
import '../home_module/list_poc.dart';

class SignInPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SignInPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  UserProfile? userProfile;
  String? userEmail;
  StoredAccessToken? accessToken;
  AnimationController? animationController;
  List<Daycare> daycareList = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  static const LINE_ICON_SIZE = 40.00;
  static const LOGO_ICON_SIZE = 135.00;
  static const Color LINE_COLOR = Color(0xFF00B900);
  static const Color BUTTON_SPLASH_COLOR = Color(0x9BADFF8D);
  final Set<String> _selectedScopes = Set.from(['profile']);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: ANIMATIONCONTROLLER_DURATION, vsync: this);
    super.initState();
    initPlatformState();
    print('initPlatformState');
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
    super.build(context);
    if (userProfile != null) {
      return ScrollPoc(
        userProfile: userProfile!,
        userEmail: userEmail,
        accessToken: accessToken!,
      );
    } else if (userProfile == null) {
      return SafeArea(
          child: Theme(
              data: DaycareAppTheme.buildLightTheme(),
              child: Container(
                  child: Scaffold(
                      backgroundColor: AppTheme.backgroundPrimary_light,
                      body: Stack(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: PADDING_20, bottom: PADDING_5),
                          child: Center(
                            child: Image.asset('assets/common/bg-login.png'),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: PADDING_230),
                                child: Text('เข้าสู่ระบบ',
                                    style: TextStyle(
                                        fontSize: AppTheme.FONT_24,
                                        fontWeight: FontWeight.w600))),
                            Center(
                                child: ClipRRect(
                                    child: Material(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          onPressed: () {
                                            _signIn();
                                          },
                                          iconSize: LOGO_ICON_SIZE,
                                          icon: Image.asset(
                                              'assets/icon/olive_icon_v3.png'),
                                        )))),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: PADDING_80,
                              ),
                              child: Text("Olive",
                                  style: TextStyle(
                                      fontSize: AppTheme.FONT_16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: PADDING_80,
                                  right: PADDING_80,
                                  top: PADDING_5),
                              child: Text("A community-based healthcare",
                                  style: AppTheme.caption),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: PADDING_80,
                                  right: PADDING_80,
                                  bottom:
                                      PADDING_30), //apply padding horizontal or vertical only
                              child: Text("support system",
                                  style: AppTheme.caption),
                            ),
                            Material(
                              color: LINE_COLOR,
                              elevation: 8,
                              borderRadius: BorderRadius.circular(PADDING_48),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                  splashColor: BUTTON_SPLASH_COLOR,
                                  onTap: () => {_signIn()},
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: PADDING_30,
                                                bottom: PADDING_30)),
                                        SizedBox(width: PADDING_40),
                                        Text('เข้าสู่ระบบผ่านไลน์',
                                            style: TextStyle(
                                                color: AppTheme.white,
                                                fontSize: AppTheme.FONT_16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(width: PADDING_20),
                                        Ink.image(
                                          image: AssetImage(
                                              'assets/icon/line.png'),
                                          height: LINE_ICON_SIZE,
                                          width: LINE_ICON_SIZE,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(width: PADDING_30),
                                      ])),
                            )
                          ],
                        )
                      ])))));
    } else {
      saveToPref();
      return ScrollPoc(
        userProfile: userProfile!,
        userEmail: userEmail,
        accessToken: accessToken!,
      );
    }
  }

  void _signIn() async {
    try {
      final result =
          await LineSDK.instance.login(scopes: _selectedScopes.toList());
      final _accessToken = await LineSDK.instance.currentAccessToken;

      final _userEmail = result.accessToken.email;

      setState(() {
        userProfile = result.userProfile;
        userEmail = _userEmail;
        accessToken = _accessToken;
      });
    } on PlatformException catch (e) {
      _showDialog(context, e.toString());
    }
  }

  saveToPref() async {
    CommonSharePreferences prefs = CommonSharePreferences();
    User user = User();

    await prefs.setUserImageUrl(userProfile!.pictureUrl.toString());
    await prefs.setUserDisplayName(userProfile!.displayName.toString());
    await prefs.setAccessToken(accessToken.toString());
    user.setUserProfile(userProfile!);
    user.setAccessToken(accessToken!);
    print('save to preferences');
    print('save to user: ' +
        user.currentUserProfile.displayName +
        user.currentAccessToken.toString());
  }

  void _signOut() async {
    try {
      await LineSDK.instance.logout();
      setState(() {
        userProfile = null;
        userEmail = null;
        accessToken = null;
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  void _showDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFFFFFFF))),
          ],
        );
      },
    );
  }
}
