import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/features/splash/ui/widgets/splash_widgets.dart';

import '../../cubit/Startup_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StartupCubit(),
      child: SplashWidgets(),
    );
  }
}
