import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunday/LoginPage/ui/screen/loginpage_screen.dart';
import 'package:sunday/common/textfield/utils/shared_pref.dart';
import 'package:sunday/widgets/roundbotton.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundButton(
            text: "LogOut",
            ontap: () {
              FirebaseAuth.instance.signOut();
              SharedPref.removeUsertoken();
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: LoginPagesScreen(), type: PageTransitionType.fade),
                  (route) => false);
            }),
      ),
    );
  }
}
