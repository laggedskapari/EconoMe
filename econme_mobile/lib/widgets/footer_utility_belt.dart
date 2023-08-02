import 'package:flutter/material.dart';

class FooterUtilityBelt extends StatelessWidget {
  const FooterUtilityBelt({super.key, required this.createNewExpense});

  final void Function() createNewExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        children: [
          const Text('Total : \$ 1899'),
          const Spacer(),
          IconButton(
            onPressed: createNewExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
