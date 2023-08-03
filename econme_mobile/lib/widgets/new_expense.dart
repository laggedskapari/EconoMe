import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:econme_mobile/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(
      {super.key,
      required this.showNewExpenseWidget,
      required this.closeNewExpenseWidget,
      required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;
  final bool showNewExpenseWidget;
  final void Function() closeNewExpenseWidget;

  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime date = DateTime.now();
  Category? _selectedCategory;
  AmountType? _selectedAmountType;

  bool showWidget = false;
  bool showErrorWidget = false;

  void _presentDatePicker() {
    final now = DateTime.now();
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 190,
        color: const Color.fromARGB(255, 178, 178, 178),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                initialDateTime: now,
                maximumDate: now,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  setState(
                    () {
                      date = value;
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitNewExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountValid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || isAmountValid) {
      setState(() {
        showErrorWidget = true;
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            showErrorWidget = false;
          });
        });
      });
      return;
    }

    widget.onAddExpense(
      Expense(
        type: _selectedAmountType!,
        category: _selectedCategory!,
        title: _titleController.text,
        amount: enteredAmount,
        date: date,
      ),
    );
    _amountController.text = '';
    _titleController.text = '';
    _selectedCategory = null;
    _selectedAmountType = null;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showWidget = widget.showNewExpenseWidget;
    return Visibility(
      visible: showWidget,
      child: Container(
        decoration: null,
        padding: const EdgeInsets.fromLTRB(50, 40, 40, 40),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                fontFamily: 'JetBrainsMono',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color.fromARGB(255, 178, 178, 178),
              ),
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: '//title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 178, 178, 178),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconSize: 0.0,
                      style: const TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 178, 178, 178),
                        fontSize: 15,
                      ),
                      hint: const Text(
                        '//category',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 178, 178, 178),
                          fontSize: 15,
                        ),
                      ),
                      isDense: false,
                      dropdownColor: const Color.fromARGB(255, 50, 52, 55),
                      borderRadius: BorderRadius.circular(5),
                      value: _selectedCategory,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                      items: Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toString().toLowerCase(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      iconSize: 0.0,
                      style: const TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 178, 178, 178),
                        fontSize: 15,
                      ),
                      hint: const Text(
                        '//amount type',
                        style: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 178, 178, 178),
                          fontSize: 15,
                        ),
                      ),
                      isDense: false,
                      dropdownColor: const Color.fromARGB(255, 50, 52, 55),
                      borderRadius: BorderRadius.circular(5),
                      value: _selectedAmountType,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedAmountType = value;
                        });
                      },
                      items: AmountType.values
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(
                                type.name.toString().toLowerCase(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextField(
                      style: const TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color.fromARGB(255, 178, 178, 178),
                      ),
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration.collapsed(
                        hintText: '//amount',
                        hintStyle: TextStyle(
                          fontFamily: 'JetBrainsMono',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Color.fromARGB(255, 178, 178, 178),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        formatter.format(date),
                        style: const TextStyle(
                          fontFamily: 'JetBrainsMono',
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 178, 178, 178),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_today,
                          color: Color.fromARGB(255, 178, 178, 178),
                          size: 15,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: IconButton(
                        onPressed: _submitNewExpense,
                        icon: const Icon(
                          Icons.check,
                          color: Color.fromARGB(255, 178, 178, 178),
                          size: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: widget.closeNewExpenseWidget,
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 178, 178, 178),
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: showErrorWidget,
                  child: const Text(
                    '// some values may not be valid.',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
