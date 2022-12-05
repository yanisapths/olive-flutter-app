import 'package:flutter/widgets.dart';

import '../modules/appointment_module/appointment_screen.dart';
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
      imagePath: 'assets/landing/find_box.png',
      navigateScreen: DaycareHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/landing/create_box.png',
      navigateScreen: AppointmentScreen(),
    ),
  ];
}
