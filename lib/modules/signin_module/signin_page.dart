import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:olive/app_theme.dart';
import 'package:olive/modules/home_module/home_screen.dart';

import '../../common/app_constant.dart';
import '../../entities/daycare_entities.dart';
import '../../model/homelist.dart';
import '../daycare_module/daycare_theme.dart';

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
  final ScrollController _scrollController = ScrollController();
  List<Daycare> daycareList = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  List<HomeList> homeList = HomeList.homeList;
  static const LINE_ICON_SIZE = 350.00;

  final Set<String> _selectedScopes = Set.from(['profile']);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: ANIMATIONCONTROLLER_DURATION, vsync: this);
    super.initState();
    initPlatformState();
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
    if (userProfile == null) {
      return SafeArea(
          child: Theme(
              data: DaycareAppTheme.buildLightTheme(),
              child: Container(
                  child: Scaffold(
                      backgroundColor: AppTheme.backgroundPrimary_light,
                      body: Stack(children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: PADDING_20, bottom: PADDING_12),
                          child: Center(
                            child: Image.asset('assets/common/bg-login.png'),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: PADDING_230),
                                child: Text('เข้าสู่ระบบผ่านไลน์แอพพลิเคชัน',
                                    style:
                                        TextStyle(fontSize: AppTheme.FONT_20))),
                            Center(
                                child: ClipRRect(
                                    child: Material(
                                        color: Colors.transparent,
                                        child: IconButton(
                                          onPressed: () {
                                            _signIn();
                                          },
                                          iconSize: LINE_ICON_SIZE,
                                          icon: Image.asset(
                                              'assets/icon/line_icon.png'),
                                        ))))
                          ],
                        )
                      ])))));
    } else {
      return HomeLandingPage(
          userProfile: userProfile!,
          userEmail: userEmail,
          accessToken: accessToken!,
          onSignOutPressed: _signOut,
          animationController: animationController,
          homeList: homeList);
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
