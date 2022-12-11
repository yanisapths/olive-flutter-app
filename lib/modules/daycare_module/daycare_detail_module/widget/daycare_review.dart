import 'package:flutter/material.dart';

import '../../../../entities/daycare_entity.dart';

class ReviewDaycare extends StatelessWidget {
  const ReviewDaycare({Key? key, this.daycareData}) : super(key: key);

  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
    );
  }
}
