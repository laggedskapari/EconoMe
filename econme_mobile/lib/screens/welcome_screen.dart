import 'package:flutter/material.dart';
import 'package:econme_mobile/widgets/logo.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // final void Function() initiateApp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset('assets/images/noiseBackground.png').image,
            fit: BoxFit.cover,
          ),
        ),
        child: const Logo(),
      ),
    );
  }
}
