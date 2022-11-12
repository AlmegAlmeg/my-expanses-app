import 'package:get/get.dart';
import 'package:myexpenessapp/model/expanse.dart';
import 'package:myexpenessapp/model/income.dart';
import 'package:myexpenessapp/utils/format_number.dart';

class ExpanseController extends GetxController {
  RxList<Expanse> expanses = <Expanse>[
    Expanse(id: "e1", info: "ביטוח רכב", price: 4200),
    Expanse(id: "e2", info: "קניות שופרסל", price: 132.7),
    Expanse(id: "e3", info: "מתנה לחן", price: 600),
    Expanse(id: "e4", info: "רובן", price: 59),
    Expanse(id: "e5", info: "ארנונה", price: 431.3),
    Expanse(id: "e6", info: "קניות ירקות", price: 8.2),
  ].obs;
  RxList<Income> incomes = <Income>[].obs;

  String getBalance() {
    return fromatNumber(12);
  }

  void addExpanse(String newInfo, double newPrice) {
    expanses.add(Expanse(
      id: "e${expanses.length}",
      info: newInfo,
      price: newPrice,
    ));

    update();
  }

  void addIncome(String newInfo, double newPrice) {
    incomes.add(Income(
      id: "i${incomes.length}",
      info: newInfo,
      price: newPrice,
    ));

    update();
  }
}
