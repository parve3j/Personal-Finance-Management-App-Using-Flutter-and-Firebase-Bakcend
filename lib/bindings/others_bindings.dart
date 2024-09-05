import 'package:get/get.dart';
import 'package:personal_finance_management_app/controller/auth_controller.dart';
import 'package:personal_finance_management_app/controller/expense_controller.dart';
import 'package:personal_finance_management_app/controller/income_controller.dart';

class OthersBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ExpenseController());
    Get.put(IncomeController());
  }

}
