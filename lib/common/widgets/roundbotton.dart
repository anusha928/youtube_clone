import 'package:flutter/material.dart';
import '../utils/colors.dart';

class RoundButton extends StatefulWidget {
  final String text;
  final void Function() ontap;

  const RoundButton({super.key, required this.text, required this.ontap});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: InkWell(
        onTap: widget.ontap,
        child: Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.symmetric(horizontal: 124, vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.bottomcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
