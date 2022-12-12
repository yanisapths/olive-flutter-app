import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olive/app_theme.dart';
import 'package:olive/modules/appointment_module/appointment_screen.dart';

import '../../../entities/daycare_entity.dart';
import '../app_constant.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({Key? key, this.daycareData}) : super(key: key);

  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.secondaryGreenDark,
      elevation: 6,
      shadowColor: AppTheme.pureBlack.withOpacity(0.3),
      borderRadius: BorderRadius.circular(PADDING_36),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
          onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentScreen()),
                )
              },
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: PADDING_12,
                        right: PADDING_28,
                        left: PADDING_28,
                        bottom: PADDING_12),
                    child: Text('จองนัด',
                        style: GoogleFonts.notoSansThai(
                            textStyle: TextStyle(
                                fontSize: AppTheme.FONT_20,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.white,
                                letterSpacing: 0.5)))),
              ])),
    );
  }
}
