import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final double windSpeed;
  final int humidity;

  const AdditionalInfo({
    Key? key,
    required this.windSpeed,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/wind.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wind Speed',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "$windSpeed m/s",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/humidity.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Humidity',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "$humidity %",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
