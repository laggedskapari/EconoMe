import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';
import 'package:econme_mobile/widgets/expense_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpenseCard(
        expense: expenses[index],
      ),
    );
  }
}
