import 'package:get/get.dart';
import 'package:myexpenessapp/model/expanse.dart';
import 'package:myexpenessapp/model/income.dart';

class ExpanseController extends GetxController {
  RxList<Expanse> expanses = <Expanse>[].obs;
  RxList<Income> incomes = <Income>[].obs;

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
