import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../entities/daycare_entities.dart';
import '../../../helpers/network_constant.dart';
import '../../../helpers/network_helper.dart';

abstract class DaycareBlocEvent {}

class DaycareListsBlocEvent extends DaycareBlocEvent {}

class DaycareBloc extends Bloc<DaycareBlocEvent, DaycareBlocState> {
  static DaycareBloc shared = DaycareBloc();

  DaycareBloc() : super(DaycareBlocState()) {
    emit(DaycareBlocState());
  }

  setDaycareList(Daycare daycare) {
    state.daycare = daycare;
    emit(state);
  }

  setVoidCallback(VoidCallback? callBack) {
    state.callBack = callBack;
    emit(state);
  }

  setAnimationController(AnimationController? animationController) {
    state.animationController = animationController;
    emit(state);
  }

  setAnimation(Animation<double>? animation) {
    state.animation = animation;
    emit(state);
  }

  sendFetchDaycareRequest() async {
    final networkHelper = NetworkHelper();
    final data = await networkHelper.fetchDaycares(DAYCARE_URL_DEV);
    log("data: " + data[0].name);
    return data;
  }
}

class DaycareBlocState {
  Daycare? daycare;
  VoidCallback? callBack;
  AnimationController? animationController;
  Animation<double>? animation;

  DaycareBlocState({
    this.animationController,
    this.animation,
    this.daycare,
    this.callBack,
  });
}
