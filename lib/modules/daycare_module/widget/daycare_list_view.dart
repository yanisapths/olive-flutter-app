import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olive/common/app_constant.dart';
import 'package:olive/modules/daycare_module/daycare_detail_module/daycare_detail_screen.dart';
import '../../../app_theme.dart';
import '../../../entities/daycare_entity.dart';
import '../daycare_theme.dart';

class DaycareListView extends StatelessWidget {
  const DaycareListView({
    Key? key,
    this.animationController,
    this.animation,
    this.daycareData,
    this.callBack,
  }) : super(key: key);

  final Daycare? daycareData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
            opacity: animation!,
            child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 50 * (1.0 - animation!.value), 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 8, bottom: 20),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: callBack,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: AppTheme.lightGrey.withOpacity(0.2),
                            offset: const Offset(1, 1),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(PADDING_20)),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                InkWell(
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    onTap: () {
                                      Navigator.push<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                DaycareDetailScreen(
                                                  callBack: callBack,
                                                  daycareData: daycareData,
                                                )),
                                      );
                                    },
                                    child: AspectRatio(
                                        aspectRatio: 2,
                                        child: Image.network(
                                          daycareData!.imageUrl,
                                          fit: BoxFit.cover,
                                        ))),
                                Container(
                                  height: PADDING_120,
                                  color: DaycareAppTheme.buildLightTheme()
                                      .backgroundColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.all(PADDING_12),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: Text(
                                                      daycareData!.daycareName,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: GoogleFonts.notoSansThai(
                                                          textStyle: TextStyle(
                                                              fontSize: AppTheme
                                                                  .FONT_20,
                                                              color: AppTheme
                                                                  .pureBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              letterSpacing:
                                                                  0.5))),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: Text(
                                                      daycareData!.address,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: GoogleFonts.notoSansThai(
                                                          textStyle: TextStyle(
                                                              fontSize: AppTheme
                                                                  .FONT_12,
                                                              color: AppTheme
                                                                  .pureBlack,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              letterSpacing:
                                                                  0.5))),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: DaycareAppTheme.buildLightTheme()
                                          .primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
      },
    );
  }
}
