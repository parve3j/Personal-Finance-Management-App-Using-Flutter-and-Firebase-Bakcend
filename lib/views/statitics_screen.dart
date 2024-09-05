// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/expense_controller.dart';
// import '../controller/income_controller.dart';
//
// class StatisticsScreen extends StatelessWidget {
//   final IncomeController incomeController = Get.find();
//   final ExpenseController expenseController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Statistics'),
//       ),
//       body: Obx(() {
//         double totalIncome = incomeController.incomes.fold(
//             0, (sum, income) => sum + income.amount);
//         double totalExpenses = expenseController.expenses.fold(
//             0, (sum, expense) => sum + expense.amount);
//         double netBalance = totalIncome - totalExpenses;
//
//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Total Income: \$${totalIncome.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 18)),
//               Text('Total Expenses: \$${totalExpenses.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 18)),
//               Text('Net Balance: \$${netBalance.toStringAsFixed(2)}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 20),
//               Text('Income vs Expenses',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 20),
//               SizedBox(height: 200, // Adjust height as needed
//                 child: PieChart(
//                   PieChartData(
//                     sections: [
//                       PieChartSectionData(
//                         color: Colors.green,
//                         value: totalIncome,
//                         title: 'Income',
//                         radius: 50,
//                         titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//                       ),
//                       PieChartSectionData(
//                         color: Colors.red,
//                         value: totalExpenses,
//                         title: 'Expenses',
//                         radius: 50,
//                         titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//                       ),
//                     ],
//                     centerSpaceRadius: 50,
//                     borderData: FlBorderData(show: false),
//                     sectionsSpace: 2,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_colors.dart';
import '../controller/expense_controller.dart';
import '../controller/income_controller.dart';

class StatisticsScreen extends StatelessWidget {
  final IncomeController incomeController = Get.find();
  final ExpenseController expenseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: AppColors.mandarinColor,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: Obx(() {
        double totalIncome = incomeController.incomes.fold(
            0, (sum, income) => sum + income.amount);
        double totalExpenses = expenseController.expenses.fold(
            0, (sum, expense) => sum + expense.amount);
        double netBalance = totalIncome - totalExpenses;

        // Calculate total for the pie chart
        double total = totalIncome + totalExpenses;
        double incomePercentage = total > 0 ? (totalIncome / total) * 100 : 0;
        double expensesPercentage = total > 0 ? (totalExpenses / total) * 100 : 0;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStatCard(
                title: 'Total Income',
                amount: totalIncome,
                color: Colors.green,
              ),
              _buildStatCard(
                title: 'Total Expenses',
                amount: totalExpenses,
                color: Colors.red,
              ),
              _buildStatCard(
                title: 'Net Balance',
                amount: netBalance,
                color: netBalance >= 0 ? Colors.green : Colors.red,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStatCard({required String title, required double amount, required Color color}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
