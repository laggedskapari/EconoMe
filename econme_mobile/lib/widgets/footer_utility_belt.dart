import 'package:flutter/material.dart';

class FooterUtilityBelt extends StatelessWidget {
  const FooterUtilityBelt({super.key, required this.createNewExpense});

  final void Function() createNewExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 30, 30, 40),
      child: Row(
        children: [
          const Text(
            'Total : \$ 1899',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: Color.fromARGB(255, 178, 178, 178),
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: createNewExpense,
            icon: const Icon(Icons.add),
            iconSize: 15,
            color: const Color.fromARGB(255, 178, 178, 178),
          ),
        ],
      ),
    );
  }
}
