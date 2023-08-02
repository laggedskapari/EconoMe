import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';
import 'package:econme_mobile/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      type: AmountType.debit,
      category: Category.education,
      title: 'Flutter Development Course',
      amount: 20.99,
      date: DateTime.now(),
    ),
    Expense(
      type: AmountType.credit,
      category: Category.work,
      title: 'Salary',
      amount: 1200,
      date: DateTime.now(),
    ),
    Expense(
      type: AmountType.debit,
      category: Category.personal,
      title: 'Maldives Trip',
      amount: 199.99,
      date: DateTime.now(),
    ),
    Expense(
      type: AmountType.debit,
      category: Category.entertainment,
      title: 'Oppenheimer',
      amount: 20.99,
      date: DateTime.now(),
    ),
    Expense(
      type: AmountType.debit,
      category: Category.food,
      title: 'Wasabi',
      amount: 5.99,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: Column(
          children: [
            const Text(
              'Today',
              style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: Color.fromARGB(255, 226, 183, 20)),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Expanded(
              child: ExpensesList(
                expenses: _registeredExpenses,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
