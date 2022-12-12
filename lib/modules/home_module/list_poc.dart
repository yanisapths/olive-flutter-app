import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

import '../../app_theme.dart';
import '../../common/app_constant.dart';
import '../../entities/daycare_entity.dart';

class ScrollPoc extends StatelessWidget {
  const ScrollPoc(
      {Key? key,
      required this.userProfile,
      this.userEmail,
      required this.accessToken,
      required this.onSignOutPressed,
      this.daycareData})
      : super(key: key);
  final UserProfile userProfile;
  final String? userEmail;
  final StoredAccessToken accessToken;
  final Function onSignOutPressed;
  final Daycare? daycareData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
                  title: Row(
                    children: [Text('สวัสดี'), Text(userProfile.displayName)],
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
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return ListTile(
                          title: Text('Item ${index.toString()}'),
                        );
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
          color: AppTheme.nearlyWhite,
          child: Padding(
              padding: const EdgeInsets.all(PADDING_18),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.start,
                alignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScrollPoc(
                                  userProfile: userProfile,
                                  userEmail: userEmail,
                                  accessToken: accessToken,
                                  onSignOutPressed: onSignOutPressed,
                                )),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.face,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                    ),
                    onPressed: () {},
                  )
                ],
              )),
        ),
      ),
    );
  }
}
