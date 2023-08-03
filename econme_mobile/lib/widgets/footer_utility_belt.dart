import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';

class FooterUtilityBelt extends StatefulWidget {
  const FooterUtilityBelt(
      {super.key, required this.createNewExpense, required this.expensesList});

  final void Function() createNewExpense;
  final List<Expense> expensesList;

  @override
  State<FooterUtilityBelt> createState() => _FooterUtilityBeltState();
}

class _FooterUtilityBeltState extends State<FooterUtilityBelt> {
  Color totalTextColor = const Color.fromARGB(255, 226, 183, 20);

  String calculateTotalAmount() {
    double creditAmount = 0;
    double debitAmount = 0;
    for (final expense in widget.expensesList) {
      if (expense.type.toString() == 'AmountType.debit') {
        debitAmount += expense.amount;
      }
      if (expense.type.toString() == 'AmountType.credit') {
        creditAmount += expense.amount;
      }
    }
    double finalAmount = creditAmount - debitAmount;
    if (finalAmount > 0) {
      totalTextColor = Colors.green;
    }
    if (finalAmount < 0) {
      totalTextColor = const Color.fromARGB(255, 226, 183, 20);
    }
    return finalAmount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 30, 30, 40),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: '//total : ',
              style: const TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 178, 178, 178),
              ),
              children: [
                TextSpan(
                  text: calculateTotalAmount(),
                  style: TextStyle(
                    fontFamily: 'JetBrainsMono',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: totalTextColor,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: widget.createNewExpense,
            icon: const Icon(Icons.add),
            iconSize: 15,
            color: const Color.fromARGB(255, 178, 178, 178),
          ),
        ],
      ),
    );
  }
}
