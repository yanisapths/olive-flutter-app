import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olive/app_theme.dart';
import 'package:olive/common/app_constant.dart';

class TabBarAction extends StatelessWidget {
  const TabBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: PADDING_46,
          decoration: BoxDecoration(
            color: AppTheme.primary_main,
            borderRadius: BorderRadius.circular(PADDING_60),
          ),
          child: TabBar(
              indicator: BoxDecoration(
                color: AppTheme.secondaryGreenDark,
                borderRadius: BorderRadius.circular(PADDING_60),
              ),
              indicatorColor: Color.fromARGB(255, 19, 148, 124),
              indicatorPadding:
                  EdgeInsets.only(right: PADDING_12, left: PADDING_12),
              labelColor: AppTheme.white,
              unselectedLabelColor: AppTheme.pureBlack,
              tabs: [
                Tab(
                    child: Text('เกี่ยวกับ',
                        style: GoogleFonts.notoSansThai(
                            textStyle: TextStyle(
                                fontSize: AppTheme.FONT_16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5)))),
                Tab(
                    child: Text('รีวิว',
                        style: GoogleFonts.notoSansThai(
                            textStyle: TextStyle(
                                fontSize: AppTheme.FONT_16,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5))))
              ]),
        )
      ],
    );
  }
}
