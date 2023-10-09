part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class Registerloading extends RegisterState {}

class Registersucces extends RegisterState {}

class Registerfailure extends RegisterState {

  String err;

  Registerfailure({required this.err});


}
