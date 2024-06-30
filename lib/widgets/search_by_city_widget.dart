import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class SearchByCityWidget extends StatelessWidget {
  final Weather weather;

  const SearchByCityWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Weather Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            chooseWeatherIcon(weather.weatherConditionCode!),
            const SizedBox(width: 10),
            Text(
              '${weather.weatherMain}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              'assets/images/termo.png',
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text(
              'Temperature: ${weather.temperature?.celsius?.round()} °C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              'assets/images/wind.png', // Provide the correct path to the windspeed image
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text(
              'Windspeed: ${weather.windSpeed} m/s',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              'assets/images/humidity.png', // Provide the correct path to the humidity image
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text(
              'Humidity: ${weather.humidity?.toInt()} %',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget chooseWeatherIcon(int code) {
    switch (code) {
      case 200:
        return Image.asset('assets/images/11d.png', height: 40, width: 40);
      case 300:
        return Image.asset('assets/images/09d.png', height: 40, width: 40);
      case 500:
        return Image.asset('assets/images/10d.png', height: 40, width: 40);
      case 600:
        return Image.asset('assets/images/13d.png', height: 40, width: 40);
      case 700:
        return Image.asset('assets/images/50d.png', height: 40, width: 40);
      case 800:
        return Image.asset('assets/images/01d.png', height: 40, width: 40);
      case 801:
        return Image.asset('assets/images/02d.png', height: 40, width: 40);
      case 802:
        return Image.asset('assets/images/03d.png', height: 40, width: 40);
      case 803:
        return Image.asset('assets/images/04d.png', height: 40, width: 40);
      case 804:
        return Image.asset('assets/images/04d.png', height: 40, width: 40);
      default:
        return Image.asset('assets/images/unknown.png', height: 40, width: 40);
    }
  }
}
