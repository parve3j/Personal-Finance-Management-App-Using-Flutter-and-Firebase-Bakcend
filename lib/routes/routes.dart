import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:personal_finance_management_app/bindings/others_bindings.dart';
import 'package:personal_finance_management_app/views/expenses/add_expenses.dart';
import 'package:personal_finance_management_app/views/expenses/view_expenses.dart';
import 'package:personal_finance_management_app/views/home_screen.dart';
import 'package:personal_finance_management_app/views/income/add_income.dart';
import 'package:personal_finance_management_app/views/income/view_income.dart';
import 'package:personal_finance_management_app/views/statitics_screen.dart';

import '../bindings/auth_bindings.dart';
import '../views/auth/forget_password.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/registration.dart';

const String loginscreen = '/login';
const String registration = '/registration';
const String forgetpass = '/forgetpass';
const String homescreen='/homescreen';
const String addexpenses='/addexpenses';
const String viewexpenses='/viewexpenses';
const String addincome='/addincome';
const String viewincome='/viewincome';
const String statistics='/statistics';

List<GetPage> getPages = [
  GetPage(name: loginscreen, page: () => LoginScreen(), binding: AuthBinding()),
  GetPage(name: registration, page: () => Registration(), binding: AuthBinding()),
  GetPage(name: forgetpass, page: () => ForgetPassword(), binding: AuthBinding()),
  GetPage(name: forgetpass, page: () => ForgetPassword(), binding: AuthBinding()),
  GetPage(name: addexpenses, page: () => AddExpenseScreen(), binding: OthersBindings()),
  GetPage(name: viewexpenses, page: () => ViewExpensesScreen(), binding: OthersBindings()),
  GetPage(name: addincome, page: () => AddIncomeScreen(), binding: OthersBindings()),
  GetPage(name: viewincome, page: () => ViewIncomesScreen(), binding: OthersBindings()),
  GetPage(name: statistics, page: () => StatisticsScreen(), binding: OthersBindings()),
  GetPage(name: homescreen, page: ()=>HomeScreen(), binding: OthersBindings())
];
