import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.child,
    required this.func,
    this.backgroundColor,
    this.padding,
    this.width,
    this.height,
    super.key,
  });

  final Widget child;
  final void Function() func;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? white,
          elevation: 0,
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
        child: child,
      ),
    );
  }
}
