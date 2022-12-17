import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myexpenessapp/controllers/transaction_controller.dart';
import 'package:myexpenessapp/model/transaction.dart';
import 'package:myexpenessapp/pages/home_page.dart';
import 'package:myexpenessapp/widgets/customs/custom_scroll_behavior.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());

  final TransactionController tc = Get.put(TransactionController());
  await tc.getLocalStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Expenses App",
      scrollBehavior: CustomScrollBehavior(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
