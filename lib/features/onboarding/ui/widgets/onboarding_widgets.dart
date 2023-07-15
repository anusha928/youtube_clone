import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sunday/common/widgets/smalltexts.dart';

class OnboardingWidgets extends StatelessWidget {
  const OnboardingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: SmallTexts(text: "onboarding"),),
    );
  }
}