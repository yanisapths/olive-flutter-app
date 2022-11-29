import 'package:flutter/widgets.dart';

import '../modules/daycare_module/daycare_home_screen.dart';
import '../modules/service_module/introduction_animation/introduction_animation_screen.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/introduction_animation.png',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/hotel/hotel_booking.png',
      navigateScreen: DaycareHomeScreen(),
    ),
  ];
}
