import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sunday/core/cubit/signIn_cubit.dart';
import 'package:sunday/core/cubit/common_state.dart';

import 'package:sunday/common/textfield/customInputfield.dart';
import 'package:sunday/common/utils/colors.dart';
import 'package:sunday/core/cubit/social_login_cubit.dart';
import 'package:sunday/features/registerpage/ui/screen/registerScreen.dart';
import 'package:sunday/common/widgets/roundbotton.dart';
import 'package:sunday/common/widgets/smalltexts.dart';

import '../../../Dashboard/ui/screens/navscreen.dart';
import '../../../../common/utils/snackbar.dart';
import '../../../../common/widgets/socialicons.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageWidget> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isloading = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isloading,
      child: MultiBlocListener(
        listeners: [
          BlocListener<SigninCubit, CommonState>(
            listener: (context, state) {
              if (state is Commonloading) {
                setState(() {
                  _isloading:
                  true;
                });
              } else {
                setState(() {
                  _isloading:
                  false;
                });
              }
              if (state is Commonerror) {
                Snackabar.showSnackbar(
                    context: context, message: state.message);
              } else if (state is Commonsuccess) {
                Snackabar.showSnackbar(
                    context: context, message: "signedin successfully");
                Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child: NavScreens(), type: PageTransitionType.fade),
                    (route) => false);
              }
            },
          ),
          BlocListener<SocialLoginCubit, CommonState>(
            listener: (context, state) {
              if (state is Commonloading) {
                setState(() {
                  _isloading:
                  true;
                });
              } else {
                setState(() {
                  _isloading:
                  false;
                });
              }
              if (state is Commonerror) {
                Snackabar.showSnackbar(
                    context: context, message: state.message);
              } else if (state is Commonsuccess) {
                Snackabar.showSnackbar(
                    context: context, message: "signedin successfully");
                Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child: NavScreens(), type: PageTransitionType.fade),
                    (route) => false);
              }
            },
          ),
        ],
        child: Scaffold(
          body: Container(
            color: AppColors.pagecolor,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.18),
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 30,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 26),
                            child: InputField(
                              controller: _emailcontroller,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Email field can't be empty";
                                }
                                final _isvalid = EmailValidator.validate(val);
                                if (_isvalid) {
                                  return null;
                                } else {
                                  return "Enter valid email address";
                                }
                              },
                              text: "USERNAME OR EMAIL",
                              hinttext: "example@gail.com",
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 26),
                            child: InputField(
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return "Password field can't be empty";
                                } else if (val.length < 5) {
                                  return "Password should be of atleast 6 characters";
                                } else {
                                  return null;
                                }
                              },
                              controller: _passwordcontroller,
                              text: "PASSWORD",
                              hinttext: "*******",
                              obscureText: true,
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: SmallTexts(text: "Forget Password")),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: RoundButton(
                                text: "Login",
                                ontap: () {
                                  if (_formkey.currentState!.validate()) {
                                    context.read<SigninCubit>().SignIn(
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text);
                                  }
                                })),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SmallTexts(text: "Don't have an account?"),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
                                  },
                                  child: SmallTexts(
                                    weight: FontWeight.bold,
                                    text: "SignUp",
                                  ))
                            ],
                          )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SmallTexts(text: "or signin with"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialIcon(
                                onpressed: () {
                                  context
                                      .read<SocialLoginCubit>()
                                      .signinGoogle();
                                },
                                image: "assets/image/googlelogo1.png",
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.08,
                              ),
                              SocialIcon(
                                  onpressed: () {
                                    context
                                        .read<SocialLoginCubit>()
                                        .signinFacebook();
                                  },
                                  image: "assets/image/Facebook-logo.png")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
