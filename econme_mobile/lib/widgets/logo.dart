import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.initiateApp});

  final void Function() initiateApp;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'EconoMe',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color.fromARGB(255, 226, 183, 20),
            ),
          ),
          const Text(
            '// a minimalistic expense tracker.',
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontStyle: FontStyle.italic,
              fontSize: 10,
              color: Color.fromARGB(255, 178, 178, 178),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          IconButton.outlined(onPressed: initiateApp, icon: const Icon(Icons.start))
        ],
      ),
    );
  }
}
