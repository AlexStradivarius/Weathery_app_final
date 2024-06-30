import 'package:analytical_apex_weather_app/widgets/weather_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherInfo extends StatelessWidget {
  final String areaName;
  final int temperature;
  final String weatherMain;
  final DateTime date;
  final int weatherConditionCode;

  const WeatherInfo({
    Key? key,
    required this.areaName,
    required this.temperature,
    required this.weatherMain,
    required this.date,
    required this.weatherConditionCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📍 $areaName',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        Center(
          child: WeatherIcon(code: weatherConditionCode),
        ),
        Center(
          child: Text(
            ' $temperature°C',
            style: const TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
          ),
        ),
        Center(
          child: Text(
            weatherMain.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            DateFormat('EEEE dd •').add_jm().format(date),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
