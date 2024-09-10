import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:personal_finance_management_app/bindings/controller_bindings.dart';
import 'package:personal_finance_management_app/routes/routes.dart';

class FinanceManagementApp extends StatelessWidget {
  const FinanceManagementApp({super.key});
  @override
  Widget build(BuildContext context) {
    var box= GetStorage();
    var value=box.read('user');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Finance Management App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: getPages,
      initialBinding: ControllerBindings(),
      initialRoute: value != null && value["uid"] != null ? homescreen : loginscreen,
    );
  }
}
