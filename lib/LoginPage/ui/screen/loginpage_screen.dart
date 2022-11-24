import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/LoginPage/cubit/signIn_cubit.dart';
import 'package:sunday/features/social_login/cubit/social_login_cubit.dart';

import '../widget/loginpagewidget.dart';

class LoginPagesScreen extends StatelessWidget {
  const LoginPagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SigninCubit(),
        ),
        BlocProvider(
          create: (context) => SocialLoginCubit(),
        ),
      ],
      child: LoginPageWidget(),
    );
  }
}
