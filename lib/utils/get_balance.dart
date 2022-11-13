import 'package:get/get.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/controllers/income_controller.dart';
import 'package:myexpenessapp/utils/format_number.dart';

String getBalance() {
  final ExpanseController ec = Get.put(ExpanseController());
  final IncomeController ic = Get.put(IncomeController());

  double balance = ic.getTotalIncome() - ec.getTotalExpanses();

  return formatNumber(balance);
}
