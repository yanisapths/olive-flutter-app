import 'package:flutter/widgets.dart';

import '../modules/daycare_module/daycare_home_screen.dart';

class DaycareDetail {
  DaycareDetail({
    this.navigateScreen,
  });

  Widget? navigateScreen;

  static List<DaycareDetail> daycareDetail = [
    DaycareDetail(
      navigateScreen: DaycareHomeScreen(),
    ),
  ];
}
