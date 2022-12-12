import 'package:flutter/material.dart';
import 'package:olive/common/app_constant.dart';
import 'package:olive/modules/daycare_module/daycare_detail_module/daycare_detail_screen.dart';
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
                      left: 50, right: 50, top: 8, bottom: 16),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: callBack,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(4, 4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(PADDING_22)),
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
                                  color: DaycareAppTheme.buildLightTheme()
                                      .backgroundColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                            padding: EdgeInsets.all(60),
                                            child: Container()),
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
