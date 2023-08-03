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
  bool _showNewExpenseWidget = false;

  void _createNewExpense() {
    setState(() {
      _showNewExpenseWidget = true;
    });
  }

  void _closeNewExpense() {
    setState(() {
      _showNewExpenseWidget = false;
    });
  }

  void _addNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      _showNewExpenseWidget = false;
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 50, 52, 55),
        action: SnackBarAction(label: 'Undo', onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },),
        content: const Text(
          '//expense removed!',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  final List<Expense> _registeredExpenses = [];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        '//no expenses found! ( are you even a human ?)',
        style: TextStyle(
          color: Color.fromARGB(255, 178, 178, 178),
          fontWeight: FontWeight.w700,
          fontSize: 16,
          fontFamily: 'JetBrainsMono',
        ),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
              child: mainContent,
            ),
            NewExpense(
              onAddExpense: _addNewExpense,
              showNewExpenseWidget: _showNewExpenseWidget,
              closeNewExpenseWidget: _closeNewExpense,
            ),
            FooterUtilityBelt(
              createNewExpense: _createNewExpense,
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
