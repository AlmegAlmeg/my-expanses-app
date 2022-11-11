import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.child,
    required this.func,
    this.backgroundColor,
    this.padding,
    super.key,
  });

  final Widget child;
  final void Function() func;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? grey,
        elevation: 0,
        padding: padding,
      ),
      child: child,
    );
  }
}
