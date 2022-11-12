import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/home_page.dart';
import 'package:myexpenessapp/widgets/customs/custom_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Almeg's Expanses",
      scrollBehavior: CustomScrollBehavior(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
