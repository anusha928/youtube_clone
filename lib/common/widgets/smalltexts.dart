import 'package:flutter/cupertino.dart';
import 'package:sunday/common/utils/colors.dart';

class SmallTexts extends StatelessWidget {
  Color? color;
  double height;
  final String text;
  double size;
  FontWeight? weight ;

  SmallTexts({
    super.key,
    this.color,
    required this.text,
    this.height = 1.2,
    this.size = 16,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.mainblackColor,
        fontSize: size,
        fontWeight: weight
      ),
    );
  }
}
