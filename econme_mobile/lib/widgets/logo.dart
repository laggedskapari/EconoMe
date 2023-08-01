import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'EconoMe',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color.fromARGB(255, 226, 183, 20),
            ),
          ),
          Text(
            '// a minimalistic expense tracker.',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontStyle: FontStyle.italic,
              fontSize: 10,
              color: Color.fromARGB(255, 178, 178, 178),
            ),
          ),
        ],
      ),
    );
  }
}
