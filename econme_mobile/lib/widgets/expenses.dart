import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';
import 'package:econme_mobile/widgets/expenses_list.dart';
import 'package:econme_mobile/widgets/footer_utility_belt.dart';
import 'package:econme_mobile/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  bool showNewExpenseWidget = false;

  void createNewExpense() {
    setState(() {
      showNewExpenseWidget = true;
    });
  }

  void closeNewExpense(){
    setState(() {
      showNewExpenseWidget = false;

    });
  }

  void addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      showNewExpenseWidget = false;
    });
  }

  final List<Expense> _registeredExpenses = [];

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
            NewExpense(
              onAddExpense: addNewExpense,
              showNewExpenseWidget: showNewExpenseWidget,
              closeNewExpenseWidget: closeNewExpense,
            ),
            FooterUtilityBelt(
              createNewExpense: createNewExpense,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
