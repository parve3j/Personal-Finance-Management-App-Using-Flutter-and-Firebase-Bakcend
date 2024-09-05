import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/expense.dart';
import '../controller/income.dart';

class StatisticsScreen extends StatelessWidget {
  final IncomeController incomeController = Get.find();
  final ExpenseController expenseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Obx(() {
        double totalIncome = incomeController.incomes.fold(
            0, (sum, income) => sum + income.amount);
        double totalExpenses = expenseController.expenses.fold(
            0, (sum, expense) => sum + expense.amount);
        double netBalance = totalIncome - totalExpenses;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Income: \$${totalIncome.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18)),
              Text('Total Expenses: \$${totalExpenses.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18)),
              Text('Net Balance: \$${netBalance.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Income vs Expenses',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              // SizedBox(height: 200, // Adjust height as needed
              //   child: PieChart(
              //     PieChartData(
              //       sections: [
              //         PieChartSectionData(
              //           color: Colors.green,
              //           value: totalIncome,
              //           title: 'Income',
              //           radius: 50,
              //           titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              //         ),
              //         PieChartSectionData(
              //           color: Colors.red,
              //           value: totalExpenses,
              //           title: 'Expenses',
              //           radius: 50,
              //           titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              //         ),
              //       ],
              //       centerSpaceRadius: 50,
              //       borderData: FlBorderData(show: false),
              //       sectionsSpace: 2,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }

}
