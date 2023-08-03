import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';
import 'package:econme_mobile/widgets/expense_card.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: const Icon(
          Icons.delete_forever_rounded,
          color: Colors.red,
        ),
        secondaryBackground: const Icon(
          Icons.delete_forever_rounded,
          color: Colors.red,
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ExpenseCard(
          expense: expenses[index],
        ),
      ),
    );
  }
}
