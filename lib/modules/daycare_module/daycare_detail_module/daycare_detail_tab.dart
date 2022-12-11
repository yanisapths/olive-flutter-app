import 'package:flutter/material.dart';
import 'package:olive/common/material/OLTabBody.dart';
import '../../../common/material/OLTab.dart';
import '../../../entities/daycare_entity.dart';

class DaycareDetailTab extends StatelessWidget {
  const DaycareDetailTab({Key? key, this.daycareData}) : super(key: key);

  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
            children: [TabBarAction(), TabBarBody(daycareData: daycareData)]));
  }
}
