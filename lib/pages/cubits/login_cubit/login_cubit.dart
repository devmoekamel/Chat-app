import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String ?email ;
  Future<void> login_user(
      {required String email, required String passsword}) async {
    emit(Loginloading());

    try {
      // print(email);
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passsword);
      emit(Loginsuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(Loginfailure(err: "user-not-found"));
      } else if (ex.code == 'wrong-password') {
        emit(Loginfailure(err: "wrong-password"));
      }
    } on Exception catch (e) {
      emit(Loginfailure(err: "somthing went wrong"));
    }
  }
}
