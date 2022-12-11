import 'package:flutter/material.dart';
import 'package:olive/common/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../app_theme.dart';
import '../../../../entities/daycare_entity.dart';

class AboutDaycare extends StatelessWidget {
  const AboutDaycare({Key? key, this.daycareData}) : super(key: key);

  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: Text('ที่อยู่',
              style: GoogleFonts.notoSansThai(
                  textStyle: TextStyle(
                      fontSize: AppTheme.FONT_20,
                      color: AppTheme.pureBlack,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5))),
          top: PADDING_22,
          left: PADDING_24,
          right: 0,
          bottom: 0),
      Positioned(
          child: Text(daycareData!.address,
              style: GoogleFonts.notoSansThai(
                  textStyle: TextStyle(
                      fontSize: AppTheme.FONT_20,
                      color: AppTheme.pureBlack,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5))),
          top: PADDING_60,
          left: PADDING_24,
          bottom: PADDING_60),
      Positioned(
          child: Text('เกี่ยวกับ',
              style: GoogleFonts.notoSansThai(
                  textStyle: TextStyle(
                      fontSize: AppTheme.FONT_20,
                      color: AppTheme.pureBlack,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5))),
          top: 120,
          left: PADDING_24,
          right: 0,
          bottom: PADDING_60),
      Positioned(
          child: Text(daycareData!.description,
              style: GoogleFonts.notoSansThai(
                  textStyle: TextStyle(
                      fontSize: AppTheme.FONT_20,
                      color: AppTheme.pureBlack,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5))),
          top: 160,
          left: PADDING_24,
          right: PADDING_24,
          bottom: PADDING_60),
    ]);
  }
}
