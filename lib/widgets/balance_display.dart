import 'package:flutter/material.dart';

class BalanceDisplay extends StatelessWidget {
  final dynamic netBalance;

  const BalanceDisplay({Key? key, required this.netBalance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100], // Light background color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            netBalance >= 0 ? Icons.account_balance_wallet : Icons.money_off,
            color: netBalance >= 0 ? Colors.green : Colors.red,
            size: 28, // Icon size
          ),
          SizedBox(width: 8), // Spacing between icon and text
          Text(
            'Current Balance: \$${netBalance.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: netBalance >= 0 ? Colors.green : Colors.red, // Dynamic color
              shadows: const [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black26,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
