import 'package:get/get.dart';

import '../controller/auth.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}