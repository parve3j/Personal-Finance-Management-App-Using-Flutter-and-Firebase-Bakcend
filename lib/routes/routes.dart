import 'package:get/get.dart';

import '../presentation/views/auth/forget_password_screen.dart';
import '../presentation/views/auth/login_screen.dart';
import '../presentation/views/auth/registration_screen.dart';
import '../presentation/views/expenses/add_expenses.dart';
import '../presentation/views/expenses/view_expenses.dart';
import '../presentation/views/home_screen.dart';
import '../presentation/views/income/add_income.dart';
import '../presentation/views/income/view_income.dart';
import '../presentation/views/statitics_screen.dart';
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
  GetPage(name: loginscreen, page: () => LoginScreen()),
  GetPage(name: registration, page: () => RegistrationScreen()),
  GetPage(name: forgetpass, page: () => ForgetPasswordScreen()),
  GetPage(name: forgetpass, page: () => ForgetPasswordScreen()),
  GetPage(name: addexpenses, page: () => AddExpenseScreen()),
  GetPage(name: viewexpenses, page: () => ViewExpensesScreen()),
  GetPage(name: addincome, page: () => AddIncomeScreen()),
  GetPage(name: viewincome, page: () => ViewIncomesScreen()),
  GetPage(name: statistics, page: () => StatisticsScreen()),
  GetPage(name: homescreen, page: ()=>HomeScreen())
];
