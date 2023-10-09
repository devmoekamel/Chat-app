part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loginloading extends LoginState {}

class Loginsuccess extends LoginState {}

class Loginfailure extends LoginState {
  String err;
  
    Loginfailure({required this.err});

}
