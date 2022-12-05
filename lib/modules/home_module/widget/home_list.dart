import 'package:flutter/material.dart';
import 'package:olive/common/app_constant.dart';
import 'package:olive/modules/home_module/widget/home_list_view.dart';
import '../../../app_theme.dart';
import '../../../model/homelist.dart';

class HomeListScreen extends StatefulWidget {
  const HomeListScreen({Key? key}) : super(key: key);

  @override
  HomeListState createState() => HomeListState();
}

class HomeListState extends State<HomeListScreen>
    with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
        backgroundColor:
            isLightMode == true ? AppTheme.white : AppTheme.nearlyBlack,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Padding(
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: FutureBuilder<bool>(
                        future: getData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox();
                          } else {
                            return GridView(
                              padding: const EdgeInsets.only(
                                  top: 45, left: 50, right: 50),
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              children: List<Widget>.generate(
                                homeList.length,
                                (int index) {
                                  final int count = homeList.length;
                                  final Animation<double> animation =
                                      Tween<double>(begin: 0.0, end: 1.0)
                                          .animate(
                                    CurvedAnimation(
                                      parent: animationController!,
                                      curve: Interval((1 / count) * index, 1.0,
                                          curve: Curves.fastOutSlowIn),
                                    ),
                                  );
                                  animationController?.forward();
                                  return HomeListView(
                                    animation: animation,
                                    animationController: animationController,
                                    listData: homeList[index],
                                    callBack: () {
                                      Navigator.push<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) =>
                                              homeList[index].navigateScreen!,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 40.0,
                                crossAxisSpacing: 16.0,
                                childAspectRatio: 2.0,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        bottomNavigationBar: BottomAppBar(
            color: AppTheme.white,
            elevation: PADDING_12,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: OverflowBar(
                    overflowAlignment: OverflowBarAlignment.center,
                    alignment: MainAxisAlignment.center,
                    overflowSpacing: 5.0,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.home),
                            onPressed: () {},
                          ),
                          Text('หน้าหลัก'),
                        ],
                      ),
                      const SizedBox(width: 100.00),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.person_outline),
                            onPressed: () {},
                          ),
                          Text('บัญชี'),
                        ],
                      ),
                    ]))));
  }
}
