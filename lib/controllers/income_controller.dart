import 'package:get/get.dart';
import 'package:myexpenessapp/model/income.dart';

class IncomeController extends GetxController {
  RxList<Income> incomes = <Income>[
    Income(id: "i1", info: "משכורת", price: 7781),
  ].obs;

  double getTotalIncome() {
    double totalIncome = 0;
    for (var inc in incomes) {
      totalIncome = totalIncome + inc.price;
    }
    return totalIncome;
  }

  void addIncome(String newInfo, double newPrice) {
    incomes.add(Income(
      id: "i${incomes.length}",
      info: newInfo,
      price: newPrice,
    ));

    update();
  }

  void deleteIncome(String id) {
    incomes.removeWhere((inc) => inc.id == id);

    update();
  }
}
