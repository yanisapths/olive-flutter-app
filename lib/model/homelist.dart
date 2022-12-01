import 'package:flutter/widgets.dart';

import '../modules/daycare_module/daycare_home_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/landing/daycare_service_landing.png',
      navigateScreen: DaycareHomeScreen(),
    ),
  ];
}
