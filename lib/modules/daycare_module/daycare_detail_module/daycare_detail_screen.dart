import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olive/common/app_constant.dart';
import 'package:olive/modules/daycare_module/daycare_home_screen.dart';
import '../../../app_theme.dart';
import '../../../common/material/OLBottomAction.dart';
import '../../../entities/daycare_entity.dart';
import 'daycare_detail_tab.dart';

class DaycareDetailScreen extends StatelessWidget {
  const DaycareDetailScreen({Key? key, this.daycareData, this.callBack})
      : super(key: key);

  final Daycare? daycareData;
  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.primary_main,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar.large(
                  leading: IconButton(
                    splashColor: AppTheme.backgroundPrimary_light,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DaycareHomeScreen()),
                      );
                    },
                    icon: Icon(Icons.chevron_left,
                        size: BACK_ARROW_SIZE, color: AppTheme.pureBlack),
                  ),
                  snap: false,
                  floating: false,
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height * 0.50,
                  flexibleSpace: Stack(
                    children: [
                      Positioned(
                          child: Opacity(
                            opacity: 0.9,
                            child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(daycareData!.imageUrl)),
                          ),
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0),
                      Positioned(
                        child: Stack(children: [
                          Padding(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: AppTheme.primary_main,
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppTheme.pureBlack.withOpacity(0.5),
                                      blurRadius: 80,
                                      spreadRadius: 50,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(50),
                                  ),
                                ),
                              )),
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: PADDING_26,
                                    bottom: PADDING_10,
                                    left: PADDING_80,
                                    right: PADDING_80),
                                child: Text(daycareData!.daycareName,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: GoogleFonts.notoSansThai(
                                        textStyle: TextStyle(
                                            fontSize: AppTheme.FONT_28,
                                            color: AppTheme.pureBlack,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5))),
                              ),
                            ],
                          )
                        ]),
                        bottom: -1,
                        left: 0,
                        right: 0,
                      ),
                    ],
                  ),
                  forceElevated: innerBoxIsScrolled,
                ),
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              // Builder required to obtain correct BuildContext.
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  SliverFixedExtentList(
                    itemExtent: 500.0,
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                            child: DaycareDetailTab(
                          daycareData: daycareData,
                        ));
                      },
                      childCount: 1,
                    ),
                  )
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: PADDING_10,
          color: AppTheme.primary_main,
          child: Padding(
              padding: const EdgeInsets.all(PADDING_18),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                alignment: MainAxisAlignment.center,
                children: [
                  ButtonAction(
                    daycareData: daycareData,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
