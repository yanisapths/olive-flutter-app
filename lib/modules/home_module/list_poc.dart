import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

import '../../app_theme.dart';
import '../../common/app_constant.dart';
import '../../entities/daycare_entity.dart';
import '../daycare_module/daycare_home_screen.dart';
import 'home_bottom_bar.dart';

class ScrollPoc extends StatelessWidget {
  const ScrollPoc(
      {Key? key,
      required this.userProfile,
      this.userEmail,
      required this.accessToken,
      this.daycareData})
      : super(key: key);
  final UserProfile userProfile;
  final String? userEmail;
  final StoredAccessToken accessToken;
  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar.large(
                  backgroundColor: AppTheme.white,
                  title: Row(
                    children: [Text('สวัสดี'), Text(userProfile.displayName)],
                  ),
                  shadowColor: AppTheme.pureBlack,
                  elevation: PADDING_6,
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: DaycareHomeScreen(),
        ),
        bottomNavigationBar: HomeBottomAppBar(),
      ),
    );
  }
}
