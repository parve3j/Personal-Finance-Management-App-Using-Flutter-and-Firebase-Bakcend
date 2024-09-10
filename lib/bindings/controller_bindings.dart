import 'package:get/get.dart';
import '../presentation/controller/auth_controller.dart';
import '../presentation/controller/expense_controller.dart';
import '../presentation/controller/income_controller.dart';

class ControllerBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ExpenseController());
    Get.put(IncomeController());
  }

}
