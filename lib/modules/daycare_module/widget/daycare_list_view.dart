import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                      left: 24, right: 24, top: 8, bottom: 16),
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
                                                DaycareDetailScreen()),
                                      );
                                    },
                                    child: Image.network(
                                      daycareData!.imageUrl,
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  color: DaycareAppTheme.buildLightTheme()
                                      .backgroundColor,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, top: 8, bottom: 8),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  daycareData!.daycareName,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      daycareData!.address,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.8)),
                                                    ),
                                                    const SizedBox(
                                                      width: 4,
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
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: Row(
                                                    children: <Widget>[
                                                      RatingBar(
                                                        initialRating: 3.0,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemSize: 24,
                                                        ratingWidget:
                                                            RatingWidget(
                                                          full: Icon(
                                                            Icons
                                                                .star_rate_rounded,
                                                            color: DaycareAppTheme
                                                                    .buildLightTheme()
                                                                .primaryColor,
                                                          ),
                                                          half: Icon(
                                                            Icons
                                                                .star_half_rounded,
                                                            color: DaycareAppTheme
                                                                    .buildLightTheme()
                                                                .primaryColor,
                                                          ),
                                                          empty: Icon(
                                                            Icons
                                                                .star_border_rounded,
                                                            color: DaycareAppTheme
                                                                    .buildLightTheme()
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                        itemPadding:
                                                            EdgeInsets.zero,
                                                        onRatingUpdate:
                                                            (rating) {
                                                          print(rating);
                                                        },
                                                      ),
                                                      Text(
                                                        ' 5 Reviews',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.8)),
                                                      ),
                                                    ],
                                                  ),
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
                                          children: <Widget>[
                                            Text(
                                              '\$20',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22,
                                              ),
                                            ),
                                            Text(
                                              '/per night',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey
                                                      .withOpacity(0.8)),
                                            ),
                                          ],
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
