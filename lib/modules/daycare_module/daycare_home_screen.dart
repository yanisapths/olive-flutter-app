import 'package:flutter/material.dart';
import 'package:olive/common/app_constant.dart';
import 'package:olive/entities/daycare_entity.dart';
import 'bloc/daycare_list_bloc.dart';
import 'daycare_theme.dart';
import 'widget/daycare_list_view.dart';

class DaycareHomeScreen extends StatefulWidget {
  @override
  _DaycareHomeScreenState createState() => _DaycareHomeScreenState();
}

class _DaycareHomeScreenState extends State<DaycareHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  final ScrollController _scrollController = ScrollController();
  List<Daycare> daycareList = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  void initState() {
    getDaycareData();

    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  getDaycareData() async {
    final DaycareBloc _daycareBloc = DaycareBloc();
    daycareList = await _daycareBloc.sendFetchDaycareRequest();
    setState(() {
      daycareList = daycareList;
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DaycareAppTheme.buildLightTheme().backgroundColor,
      child: ListView.builder(
        itemCount: daycareList.length,
        padding: const EdgeInsets.only(top: PADDING_100),
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final int count = daycareList.length > 10 ? 10 : daycareList.length;
          final Animation<double> animation =
              Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: animationController!,
                  curve: Interval((1 / count) * index, 1.0,
                      curve: Curves.fastOutSlowIn)));
          animationController?.forward();
          return DaycareListView(
            callBack: () {},
            daycareData: daycareList[index],
            animation: animation,
            animationController: animationController!,
          );
        },
      ),
    );
  }
}
