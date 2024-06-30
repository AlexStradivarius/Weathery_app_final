import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SunriseSunsetInfo extends StatelessWidget {
  final DateTime sunrise;
  final DateTime sunset;

  const SunriseSunsetInfo({
    Key? key,
    required this.sunrise,
    required this.sunset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/01d.png', height: 40, width: 40),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunrise',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 3),
                Text(
                  DateFormat().add_jm().format(sunrise),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset('assets/images/01n.png', height: 40, width: 40),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sunset',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 3),
                Text(
                  DateFormat().add_jm().format(sunset),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
