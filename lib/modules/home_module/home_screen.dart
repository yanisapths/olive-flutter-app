import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import '../../app_theme.dart';
import '../../common/app_constant.dart';
import '../../model/homelist.dart';

class HomeLandingPage extends StatelessWidget {
  const HomeLandingPage({Key? key}) : super(key: key);

  Future<bool> getData() async {
    await Future<dynamic>.delayed(Duration.zero);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: AppTheme.white,
          backgroundColor: AppTheme.nearlyWhite,
          scaffoldBackgroundColor: AppTheme.nearlyWhite,
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            }));
  }
}

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.userProfile,
      this.userEmail,
      required this.accessToken,
      required this.onSignOutPressed,
      required this.animationController,
      required this.homeList})
      : super(key: key);

  final UserProfile userProfile;
  final String? userEmail;
  final StoredAccessToken accessToken;
  final Function onSignOutPressed;
  final AnimationController? animationController;
  final List<HomeList> homeList;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final UserProfile userProfile;
  late final String userEmail;
  late final StoredAccessToken accessToken;
  late final AnimationController animationController;

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

  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
