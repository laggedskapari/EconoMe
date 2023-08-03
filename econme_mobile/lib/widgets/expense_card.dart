import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    Color amountColor = const Color.fromARGB(184, 104, 246, 115);

    if (amountType[expense.type] == '-') {
      amountColor = const Color.fromARGB(255, 226, 183, 20);
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                categoryIcons[expense.category],
                color: const Color.fromARGB(255, 178, 178, 178),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.formattedDate,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      fontFamily: 'JetBrainsMono',
                      color: Color.fromARGB(255, 178, 178, 178),
                    ),
                  ),
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Text(
            '${amountType[expense.type]} \$${expense.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: amountColor,
              fontSize: 15,
              fontFamily: 'JetBrainsMono',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
