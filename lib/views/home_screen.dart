import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finance_management_app/routes/routes.dart';

import '../controller/auth.dart';
import '../controller/expense.dart';
import '../controller/income.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Finance Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.logout();
            },
          ),
        ],
      ),
      body: Obx(() {
        double totalIncome = incomeController.incomes.fold(
            0, (sum, income) => sum + income.amount);
        double totalExpenses = expenseController.expenses.fold(
            0, (sum, expense) => sum + expense.amount);
        double netBalance = totalIncome - totalExpenses;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display Balance
              Text(
                'Current Balance: \$${netBalance.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Add Expense Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(addexpenses);
                },
                child: Text('Add Expense'),
              ),
              SizedBox(height: 10),

              // Add Income Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(addincome);
                },
                child: Text('Add Income'),
              ),
              SizedBox(height: 10),

              // View Expenses Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(viewexpenses);
                },
                child: Text('View Expenses'),
              ),
              SizedBox(height: 10),

              // View Incomes Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(viewincome);
                },
                child: Text('View Incomes'),
              ),
              SizedBox(height: 10),

              // View Statistics Button
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(statistics);
                },
                child: Text('View Statistics'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
