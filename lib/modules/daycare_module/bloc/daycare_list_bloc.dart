import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../entities/daycare_entities.dart';

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
