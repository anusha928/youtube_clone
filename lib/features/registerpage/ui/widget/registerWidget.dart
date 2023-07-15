import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunday/core/cubit/signup_cubit.dart';
import 'package:sunday/core/cubit/common_state.dart';
import 'package:sunday/common/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:sunday/features/LoginPage/ui/screen/loginpage_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sunday/common/textfield/customInputfield.dart';
import 'package:sunday/common/utils/colors.dart';
import 'package:sunday/common/widgets/roundbotton.dart';
import 'package:sunday/common/widgets/smalltexts.dart';
import 'package:loading_overlay/loading_overlay.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
        isLoading: isloading,
        child: Scaffold(
          body: Container(
            color: AppColors.pagecolor,
            child: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: BlocListener<SignupCubit, CommonState>(
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
                          context: context, message: "signedup successfully");
                           Navigator.of(context).pop();
                    }
                   
                  },
                  child: Form(
                    key: _formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.16),
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
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
                                text: "EMAIL",
                                hinttext: "example@gail.com",
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          // Container(
                          //     padding:
                          //         const EdgeInsets.symmetric(horizontal: 26),
                          //     child: InputField(
                          //       validator: (val) {
                          //         if (val == null || val.isEmpty) {
                          //           return "Password field can't be empty";
                          //         } else if (val.length < 5) {
                          //           return "Password should be of atleast 6 characters";
                          //         } else {
                          //           return null;
                          //         }
                          //       },
                          //       text: "CONFIRM PASSWORD",
                          //       hinttext: "*******",
                          //       obscureText: true,
                          //       controller: _confirmpasswordcontroller,
                          //     )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: RoundButton(
                                text: "SignUp",
                                ontap: () {
                                  if (_formkey.currentState!.validate()) {
                                    context.read<SignupCubit>().signup(
                                        email: _emailcontroller.text,
                                        password: _passwordcontroller.text);
                                  }
                                }),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallTexts(text: "Already have an account?"),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            LoginPagesScreen(),
                                      ));
                                    },
                                    child: SmallTexts(
                                      weight: FontWeight.bold,
                                      text: "SignIn",
                                    )),
                              ],
                            )),
                          ),
                
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
