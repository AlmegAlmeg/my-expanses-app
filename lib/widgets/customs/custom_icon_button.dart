import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({required this.icon, required this.backgroundColor, required this.func, super.key});

  final void Function() func;
  final Color backgroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(0),
          shape: const CircleBorder(),
        ),
        child: Icon(icon),
      ),
    );
  }
}
