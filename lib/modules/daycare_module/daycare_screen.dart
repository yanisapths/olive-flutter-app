import 'dart:developer';

import 'package:flutter/material.dart';

import '../../entities/daycare_entities.dart';
import '../../helpers/network_constant.dart';
import '../../helpers/network_helper.dart';
import '../../model/homelist.dart';

class DaycareListView extends StatelessWidget {
  const DaycareListView({
    Key? key,
    this.animationController,
    this.animation,
    this.listData,
    this.callBack,
  }) : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    sendFetchDaycareRequest();
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        listData!.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Future<Daycare> sendFetchDaycareRequest() async {
  final networkHelper = NetworkHelper();
  final data = await networkHelper.fetchDaycares(DAYCARE_URL);
  log("data: " + data[0].name);
  return data[0];
}
