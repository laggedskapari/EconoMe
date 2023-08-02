import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.showNewExpenseWidget});

  final bool showNewExpenseWidget;

  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.showNewExpenseWidget
        ? Container(
            decoration: null,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration.collapsed(
                    hintText: '//title',
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
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.check),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.close),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        : Container();
  }
}
