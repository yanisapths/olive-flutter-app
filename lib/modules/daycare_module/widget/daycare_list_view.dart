import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
    String base64Image = daycareData!.imageUrl;
    // Convert to UriData
    UriData? data = Uri.parse(base64Image).data;
    Uint8List bytesImage = data!.contentAsBytes();
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
            opacity: animation!,
            child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 20 * (1.0 - animation!.value), 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 8, bottom: 10),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: callBack,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(4, 4),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        child: Stack(
                          children: <Widget>[
                            Column(
                              // AspectRatio(
                              //     aspectRatio: 2,
                              //     child: Image.network(
                              //       daycareData!.imageUrl,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
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
                                    child: Image.memory(
                                      bytesImage,
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  color: DaycareAppTheme.buildLightTheme()
                                      .colorScheme
                                      .background,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, top: 8, bottom: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(daycareData!.clinicName,
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.fade,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    style: GoogleFonts
                                                        .notoSansThai(
                                                            textStyle:
                                                                TextStyle(
                                                      fontSize:
                                                          AppTheme.FONT_24,
                                                      color: AppTheme.pureBlack,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ))),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      daycareData!.address,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 2,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.8)),
                                                    ),
                                                    const SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      FontAwesomeIcons
                                                          .locationDot,
                                                      size: 12,
                                                      color: DaycareAppTheme
                                                              .buildLightTheme()
                                                          .primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16, top: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                        ),
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
