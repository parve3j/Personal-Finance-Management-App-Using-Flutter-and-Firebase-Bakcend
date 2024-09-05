import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finance_management_app/routes/routes.dart';
import '../controller/auth_controller.dart';
import '../controller/expense_controller.dart';
import '../controller/income_controller.dart';
import '../widgets/balance_display.dart';
import '../widgets/custom_build_actionbutton.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController authController = Get.find();
  final IncomeController incomeController = Get.find();
  final ExpenseController expenseController = Get.find();

  @override
  void initState() {
    Get.find<ExpenseController>().loadExpenses();
    Get.find<IncomeController>().loadIncomes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Finance Management',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              Tooltip(
                message: 'Logout',
                child: GestureDetector(
                  onTap: ()async{
                    await authController.logout();
                    Get.snackbar(
                      'Logged out',
                      'You have successfully logged out.',
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        onPressed: (){},
                      ),
                      const Text('Log Out', style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.teal,
          elevation: 5.0,
        ),

        body: Obx(() {
          double totalIncome = incomeController.incomes.fold(0, (sum, income) => sum + income.amount);
          double totalExpenses = expenseController.expenses.fold(0, (sum, expense) => sum + expense.amount);
          double netBalance = totalIncome - totalExpenses;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BalanceDisplay(netBalance: netBalance),
                    const SizedBox(height: 20),
                    customBuildButton(
                      label: 'Add Expense',
                      icon: Icons.add_circle,
                      color: Colors.redAccent,
                      onPressed: () {
                        Get.toNamed(addexpenses);
                      },
                    ),
                    const SizedBox(height: 10),
                    customBuildButton(
                      label: 'Add Income',
                      icon: Icons.add_circle_outline,
                      color: Colors.green,
                      onPressed: () {
                        Get.toNamed(addincome);
                      },
                    ),
                    const SizedBox(height: 10),
                    customBuildButton(
                      label: 'View Expenses',
                      icon: Icons.receipt_long,
                      color: Colors.orange,
                      onPressed: () {
                        Get.toNamed(viewexpenses);
                      },
                    ),
                    const SizedBox(height: 10),

                    customBuildButton(
                      label: 'View Incomes',
                      icon: Icons.account_balance_wallet,
                      color: Colors.blueAccent,
                      onPressed: () {
                        Get.toNamed(viewincome);
                      },
                    ),
                    const SizedBox(height: 10),

                    customBuildButton(
                      label: 'View Statistics',
                      icon: Icons.bar_chart,
                      color: Colors.purple,
                      onPressed: () {
                        Get.toNamed(statistics);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }


}
