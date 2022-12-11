import 'package:flutter/material.dart';
import 'package:olive/modules/daycare_module/daycare_detail_module/widget/daycare_review.dart';

import '../../entities/daycare_entity.dart';
import '../../modules/daycare_module/daycare_detail_module/widget/daycare_about.dart';

class TabBarBody extends StatelessWidget {
  const TabBarBody({Key? key, this.daycareData}) : super(key: key);

  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          AboutDaycare(daycareData: daycareData),
          ReviewDaycare(daycareData: daycareData)
        ],
      ),
    );
  }
}
