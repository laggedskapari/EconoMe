import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.showNewExpenseWidget, required this.closeNewExpenseWidget});

  final bool showNewExpenseWidget;
  final void Function() closeNewExpenseWidget;

  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  bool showWidget = false;

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
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: '//title',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintStyle: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 178, 178, 178),
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '//Category',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 178, 178, 178),
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    '//type',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 178, 178, 178),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration.collapsed(
                      hintText: '//amount',
                      hintStyle: TextStyle(
                        fontFamily: 'JetBrainsMono',
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 178, 178, 178),
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
                    const Expanded(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: IconButton(
                        onPressed: widget.closeNewExpenseWidget,
                        icon: const Icon(Icons.check),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: widget.closeNewExpenseWidget,
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
