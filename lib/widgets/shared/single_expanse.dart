import 'package:flutter/material.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/model/expanse.dart';

class SingleExpanse extends StatelessWidget {
  const SingleExpanse({required this.expanse, super.key});

  final Expanse expanse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: expanseColor,
      margin: const EdgeInsets.fromLTRB(10, 30, 0, 30),
    );
  }
}
