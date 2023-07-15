import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  
  final String image;
   void Function()? onpressed;
   SocialIcon({super.key, required this.image, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onpressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            image,
            
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
