import 'package:flutter/material.dart';

class TemperatureInfo extends StatelessWidget {
  final int tempMax;
  final int tempMin;

  const TemperatureInfo({
    Key? key,
    required this.tempMax,
    required this.tempMin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/highT.png', height: 40, width: 40),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Highest Temp',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 3),
                Text(
                  "$tempMax °C",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Image.asset('assets/images/lowT.png', height: 40, width: 40),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lowest Temp',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 3),
                Text(
                  "$tempMin °C",
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
