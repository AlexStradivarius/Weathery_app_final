import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/whiteLogo.png',
          height: 300,
        ),
        const SizedBox(height: 10),
        const Text(
          'By',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Text(
          'Analytical Apex',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
