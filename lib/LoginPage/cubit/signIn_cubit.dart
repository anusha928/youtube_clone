import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/common/textfield/utils/shared_pref.dart';

import '../../common/cubit/common_state.dart';

class SigninCubit extends Cubit<CommonState> {
  SigninCubit() : super(Commoninitial());

  SignIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user?.uid != null) {
        SharedPref.setUsertoken(credential.user!.uid);
        emit(Commonsuccess());
      } else {
        emit(Commonerror(message: "Unable to login"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(Commonerror(message: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(Commonerror(message: "Wrong password provided for that user."));
      } else {
        emit(Commonerror(message: "Unable to login"));
      }
    }
  }
}
