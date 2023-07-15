import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunday/features/Dashboard/ui/screens/navscreen.dart';
import 'package:sunday/features/LoginPage/ui/screen/loginpage_screen.dart';
import 'package:sunday/features/splash/cubit/Startup_cubit.dart';
import 'package:sunday/features/splash/cubit/startup_state.dart';
import 'package:sunday/common/widgets/smalltexts.dart';

class SplashWidgets extends StatefulWidget {
  const SplashWidgets({super.key});

  @override
  State<SplashWidgets> createState() => _SplashWidgetsState();
}

class _SplashWidgetsState extends State<SplashWidgets> {
  @override
  void initState() {
    
    super.initState();
    context.read<StartupCubit>().fetchInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<StartupCubit, SatrtupState>(
        listener: (context, state) {
          if (state is StartupSuccess) {
            if (state.isfirsttime) {
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: LoginPagesScreen(), type: PageTransitionType.fade),
                  (route) => false);
           }
            if (state.isLogedin) {
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: NavScreens(), type: PageTransitionType.fade),
                  (route) => false);
              } 
              else {
              //  Navigator.of(context).pushAndRemoveUntil(
              //     PageTransition(
              //         child: LoginPagesScreen(), type: PageTransitionType.fade),
              //     (route) => false);
            }
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/youtube_logo.png",
                width: 200,
              ),
              SmallTexts(
                text: "Youtube Clone",
                size: 20,
                weight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
