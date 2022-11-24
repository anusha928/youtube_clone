import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/common/cubit/common_state.dart';

class SignupCubit extends Cubit<CommonState> {
  SignupCubit() : super(Commoninitial());

  signup({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(Commonsuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Commonerror(message: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
            Commonerror(message: 'The account already exists for that email.'));
      } else {
        emit(Commonerror(message: e.message ?? 'Unable to login'));
      }
    } catch (e) {}
  }
}
