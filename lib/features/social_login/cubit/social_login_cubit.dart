import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sunday/common/cubit/common_state.dart';
import 'package:sunday/common/textfield/utils/shared_pref.dart';

class SocialLoginCubit extends Cubit<CommonState> {
  SocialLoginCubit() : super(Commoninitial());

  signinGoogle() async {
    emit(Commonloading());
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      final googleAccount = await _googleSignIn.signIn();
      if (googleAccount != null) {
        final authentication = await googleAccount.authentication;
        SharedPref.setUsertoken(authentication.accessToken!);
        emit(Commonsuccess());
      } else {
        emit(Commonerror(message: "Unale to login"));
      }
    } catch (e) {
      print(e);
    }
  }

  signinFacebook() async {
    emit(Commonloading());
    await FacebookAuth.instance.logOut();
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;
      SharedPref.setUsertoken(accessToken.token);
      emit(Commonsuccess());
    } else {
      emit(Commonerror(message: "Unable to login"));
      print(result.status);
      print(result.message);
    }
  }
}
