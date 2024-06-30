import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class FiveDayForecast extends StatelessWidget {
  final List<Weather> forecast;

  const FiveDayForecast({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    Map<String, List<Weather>> groupedForecast = {};
    for (var weather in forecast) {
      String dateStr = DateFormat('yyyy-MM-dd').format(weather.date!);
      if (!groupedForecast.containsKey(dateStr)) {
        groupedForecast[dateStr] = [];
      }
      groupedForecast[dateStr]!.add(weather);
    }

    List<Map<String, dynamic>> dailyForecast = [];
    groupedForecast.forEach((date, weathers) {
      double minTemp = weathers
          .map((w) => w.temperature!.celsius!)
          .reduce((a, b) => a < b ? a : b);
      double maxTemp = weathers
          .map((w) => w.temperature!.celsius!)
          .reduce((a, b) => a > b ? a : b);
      Weather mainWeather = weathers.first;
      dailyForecast.add({
        'date': DateFormat('EEEE, MMM d').format(mainWeather.date!),
        'minTemp': minTemp.round(),
        'maxTemp': maxTemp.round(),
        'weatherMain': mainWeather.weatherMain!,
        'weatherConditionCode': mainWeather.weatherConditionCode!,
      });
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dailyForecast.map((dayForecast) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            children: [
              Text(
                dayForecast['date'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                _getWeatherIcon(dayForecast['weatherConditionCode']),
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              Text(
                '${dayForecast['minTemp']}°C - ${dayForecast['maxTemp']}°C, ${dayForecast['weatherMain']}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _getWeatherIcon(int code) {
    if (code >= 200 && code < 300) {
      return 'assets/images/11d.png';
    } else if (code >= 300 && code < 400) {
      return 'assets/images/09d.png';
    } else if (code >= 500 && code < 600) {
      return 'assets/images/10d.png';
    } else if (code >= 600 && code < 700) {
      return 'assets/images/13d.png';
    } else if (code >= 700 && code < 800) {
      return 'assets/images/50d.png';
    } else if (code == 800) {
      return 'assets/images/01d.png';
    } else if (code > 800 && code <= 804) {
      return 'assets/images/04d.png';
    } else {
      return 'assets/images/02d.png';
    }
  }
}
