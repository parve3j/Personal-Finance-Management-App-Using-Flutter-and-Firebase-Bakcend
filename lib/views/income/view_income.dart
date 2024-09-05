// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/income.dart';
//
// class ViewIncomesScreen extends StatelessWidget {
//   final IncomeController incomeController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Incomes'),
//       ),
//       body: Obx(() {
//         if (incomeController.incomes.isEmpty) {
//           return Center(child: Text('No incomes added yet'));
//         } else {
//           return ListView.builder(
//             itemCount: incomeController.incomes.length,
//             itemBuilder: (context, index) {
//               final income = incomeController.incomes[index];
//               return ListTile(
//                 title: Text(income.source),
//                 subtitle: Text(
//                   'Amount: \$${income.amount.toStringAsFixed(2)}\nDate: ${income.date.toLocal()}',
//                 ),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     incomeController.deleteIncome(income.id);
//                   },
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/income.dart';

class ViewIncomesScreen extends StatelessWidget {
  final IncomeController incomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incomes'),
      ),
      body: Obx(() {
        if (incomeController.incomes.isEmpty) {
          return Center(child: Text('No incomes added yet'));
        } else {
          return ListView.builder(
            itemCount: incomeController.incomes.length,
            itemBuilder: (context, index) {
              final income = incomeController.incomes[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 4),
                child: InkWell(
                  onTap: () {
                    // Optionally, handle tap for more details
                    Get.snackbar(
                      'Income Details',
                      'Source: ${income.source}\nAmount: \$${income.amount.toStringAsFixed(2)}\nDate: ${DateFormat('yyyy-MM-dd – kk:mm').format(income.date)}',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 3),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        income.source,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amount: \$${income.amount.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(income.date)}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          incomeController.deleteIncome(income.id);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
