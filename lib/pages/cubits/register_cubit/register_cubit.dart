import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> Register_User(
      {required String email, required String password}) async {
        emit(Registerloading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(Registersucces());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "weak-password") {
              emit(Registerfailure(err:"weak password"));

      } else if (ex.code == 'email-already-in-use') {
      emit(Registerfailure(err:"email-already-in-use"));

      }
    } on Exception catch (e) {
      emit(Registerfailure(err:"something went wrong"));
    }
  }
}
