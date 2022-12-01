import 'package:bloc/bloc.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

abstract class SigninBlocEvent {}

class SignInBlocEvent extends SigninBlocEvent {}

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  static SignInBloc shared = SignInBloc();

  SignInBloc() : super(SignInBlocState()) {
    emit(SignInBlocState());
  }

  void _signOut() async {
    await LineSDK.instance.logout();
  }
}

class SignInBlocState {
  UserProfile? userProfile;
  String? userEmail;
  StoredAccessToken? accessToken;

  SignInBlocState({this.accessToken, this.userEmail, this.userProfile});
}
