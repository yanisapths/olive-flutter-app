import 'package:flutter/material.dart';

import '../../../../app_theme.dart';
import '../../../../common/app_constant.dart';
import '../../../../entities/daycare_entity.dart';

class ReviewDaycare extends StatelessWidget {
  const ReviewDaycare({Key? key, this.daycareData}) : super(key: key);

  final Daycare? daycareData;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          itemCount: daycareData?.reviews?.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final int? count = daycareData?.reviews?.length;
            return Stack(children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: PADDING_28, vertical: PADDING_5),
                child: Container(
                    height: 200,
                    padding: EdgeInsets.symmetric(vertical: PADDING_12),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppTheme.lightGrey.withOpacity(0.1),
                              spreadRadius: 0.8,
                              blurRadius: 9)
                        ],
                        borderRadius: BorderRadius.circular(PADDING_40),
                        color: AppTheme.nearlyWhite),
                    child: Stack(children: [
                      Row(children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: PADDING_2, left: PADDING_12),
                          child: Container(
                            child: Image.asset(
                              'assets/icon/olive_icon_v3.png',
                              scale: PADDING_5,
                            ),
                          ),
                        ),
                      ]),
                      Padding(
                          padding: EdgeInsets.only(
                              top: PADDING_2,
                              left: PADDING_100,
                              right: PADDING_12),
                          child: Text(
                            daycareData!.reviews![index].customerName,
                            style: TextStyle(
                                color: AppTheme.lightGrey,
                                fontSize: AppTheme.FONT_16),
                          )),
                      Row(children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: PADDING_32,
                                left: PADDING_100,
                                right: PADDING_10),
                            child: Text(daycareData!.reviews![index].comments,
                                style: TextStyle(fontSize: AppTheme.FONT_20)))
                      ])
                    ])),
              )
            ]);
          })
    ]);
  }
}
