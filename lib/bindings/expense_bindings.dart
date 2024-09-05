import 'package:get/get.dart';
import 'package:personal_finance_management_app/controller/expense.dart';
import 'package:personal_finance_management_app/controller/income.dart';

class OthersBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(ExpenseController());
    Get.put(IncomeController());
  }

}