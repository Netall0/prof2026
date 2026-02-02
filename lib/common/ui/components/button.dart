import 'package:flutter/material.dart';
import 'package:for_prof/common/ui/color/colors.dart';
import 'package:for_prof/common/ui/text/text.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.size, required this.buttonText});

  final Size size;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: size.width,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorSS.bottomColor,
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextSS.header.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
