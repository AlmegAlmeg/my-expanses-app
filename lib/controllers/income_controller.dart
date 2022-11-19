import 'package:get/get.dart';
import 'package:myexpenessapp/model/income.dart';

class IncomeController extends GetxController {
  RxList<Income> incomes = <Income>[
    Income(id: "i1", info: "משכורת", price: 7000),
  ].obs;
  RxDouble total = 0.0.obs;

  void getTotalIncome() {
    double totalIncome = 0;
    for (var inc in incomes) {
      totalIncome = totalIncome + inc.price;
    }
    total.value = totalIncome;
    update();
  }

  void addIncome(String newInfo, double newPrice) {
    incomes.add(Income(
      id: "i${incomes.length}",
      info: newInfo,
      price: newPrice,
    ));
    getTotalIncome();

    update();
  }

  void deleteIncome(String id) {
    incomes.removeWhere((inc) => inc.id == id);
    getTotalIncome();

    update();
  }

  Income findIncomeById(String id) {
    final Income income = incomes.firstWhere((inc) => inc.id == id);

    return income;
  }
}
