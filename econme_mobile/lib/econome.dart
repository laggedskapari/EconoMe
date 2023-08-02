import 'package:flutter/material.dart';
import 'package:econme_mobile/widgets/logo.dart';
import 'package:econme_mobile/widgets/expenses.dart';
import 'package:econme_mobile/widgets/footer_utility_belt.dart';

class EconoMe extends StatefulWidget {
  const EconoMe({super.key});

  @override
  State<EconoMe> createState() => _EconoMe();
}

class _EconoMe extends State<EconoMe> {
  var currentScreen = 'Welcome Screen';

  void initiateApp() {
    setState(() {
      currentScreen = 'Home Screen';
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = Logo(initiateApp: initiateApp);

    if (currentScreen == 'Home Screen') {
      screenWidget = const Expenses();
    }


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image
                  .asset('assets/images/noiseBackground.png')
                  .image,
              fit: BoxFit.cover
          ),
        ),
        child: screenWidget,
      ),
    );
  }
}
