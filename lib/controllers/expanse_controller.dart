import 'package:get/get.dart';
import 'package:myexpenessapp/model/expanse.dart';

class ExpanseController extends GetxController {
  RxList<Expanse> expanses = <Expanse>[
    Expanse(id: "e1", info: "ביטוח רכב", price: 3400),
    Expanse(id: "e2", info: "קניות שופרסל", price: 132.7),
    Expanse(id: "e3", info: "מתנה לחן", price: 1500),
    Expanse(id: "e4", info: "רובן", price: 59),
    Expanse(id: "e5", info: "ארנונה", price: 431.3),
    Expanse(id: "e6", info: "קניות ירקות", price: 8.2),
  ].obs;

  RxDouble total = 0.0.obs;

  void getTotalExpanses() {
    double totalExpanses = 0;
    for (var exp in expanses) {
      totalExpanses = totalExpanses + exp.price;
    }
    total.value = totalExpanses;

    update();
  }

  void addExpanse(String newInfo, double newPrice) {
    expanses.add(Expanse(
      id: "e${expanses.length}",
      info: newInfo,
      price: newPrice,
    ));
    getTotalExpanses();

    update();
  }

  void deleteExpanse(String id) {
    expanses.removeWhere((exp) => exp.id == id);
    getTotalExpanses();

    update();
  }
}
