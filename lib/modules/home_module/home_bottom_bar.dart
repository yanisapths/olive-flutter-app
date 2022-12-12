import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

import '../../app_theme.dart';
import '../../common/app_constant.dart';
import '../../common/share_preferences.dart';
import '../appointment_module/appointment_screen.dart';
import '../../entities/user_profile.dart';

class HomeBottomAppBar extends StatefulWidget {
  @override
  HomeBottomAppBarState createState() => HomeBottomAppBarState();
}

class HomeBottomAppBarState extends State<HomeBottomAppBar> {
  @override
  bool get wantKeepAlive => true;
  final result = LineSDK.instance.getProfile();
  CommonSharePreferences prefs = CommonSharePreferences();
  bool isTab = false;
  User user = User();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: PADDING_10,
      color: AppTheme.nearlyWhite,
      child: Padding(
          padding: const EdgeInsets.all(PADDING_18),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.start,
            alignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: isTab
                          ? AppTheme.backgroundPrimary_light
                          : AppTheme.white,
                      borderRadius: BorderRadius.circular(PADDING_32)),
                  child: IconButton(
                      icon: Icon(
                        Icons.home,
                      ),
                      iconSize: PADDING_30,
                      color: isTab ? AppTheme.white : AppTheme.grey,
                      onPressed: () {
                        // Navigator.pop(context);
                      })),
              Container(
                decoration: BoxDecoration(
                    color: isTab
                        ? AppTheme.backgroundPrimary_light
                        : AppTheme.white,
                    borderRadius: BorderRadius.circular(PADDING_32)),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  iconSize: PADDING_30,
                  color: isTab ? AppTheme.white : AppTheme.grey,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentScreen()),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
