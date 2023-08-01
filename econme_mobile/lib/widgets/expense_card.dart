import 'dart:io';

import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              Text(expense.title),
              Row(
                children: [
                  Text(expense.date.toString()),
                  Text(expense.category.toString()),
                ],
              ),
            ],
          ),
          Text(expense.amount.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
