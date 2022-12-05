import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:olive/modules/home_module/widget/home_list.dart';
import '../../app_theme.dart';
import '../../model/homelist.dart';

class HomeLandingPage extends StatelessWidget {
  const HomeLandingPage(
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

  Future<bool> getData() async {
    await Future<dynamic>.delayed(Duration.zero);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            shadowColor: Theme.of(context).colorScheme.shadow,
            backgroundColor: AppTheme.nearlyWhite,
            title: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Row(children: [
                Text(
                  'สวัสดี ',
                  style: TextStyle(
                      color: AppTheme.pureBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Text(userProfile.displayName,
                    style: TextStyle(
                        color: AppTheme.pureBlack,
                        fontSize: 30,
                        fontWeight: FontWeight.w500))
              ]),
            )),
        body: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return HomeListScreen();
              }
            }));
  }
}

AppBar appBar() {
  return AppBar(actions: <Widget>[
    Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 8),
        child: Container(
          width: AppBar().preferredSize.height - 8,
          height: AppBar().preferredSize.height - 8,
        ),
      ),
      Expanded(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          'Happy Elders',
          style: TextStyle(
            fontSize: 22,
            color: AppTheme.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      )))
    ])
  ]);
}
