import 'package:flutter/material.dart';
import 'package:sunday/common/textfield/utils/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String text;
  final Function()? onSubmit;
  final TextInputAction? textInputAction;
  final String hinttext;
  final bool obscureText;
  final Color? color;
  InputField(
      {this.text = "",
      this.color,
      this.onSubmit,
      this.textInputAction,
      required this.hinttext,
      this.validator,
      this.obscureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: "Roboto", color: AppColors.samlltextColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(12)),
            child: TextFormField(
              controller: controller,
              validator: validator,
              obscureText: obscureText,
              textInputAction: textInputAction,
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
                {
                  if (onSubmit != null) {
                    onSubmit!();
                  }
                }
                ;
              },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  hintText: hinttext,
                  hintStyle: TextStyle(color: AppColors.hintcolor)),
            ),
          ),
        ],
      ),
    );
  }
}
