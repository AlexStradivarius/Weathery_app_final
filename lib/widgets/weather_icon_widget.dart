import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final int code;

  const WeatherIcon({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/images/11d.png', height: 100, width: 100);
      case >= 300 && < 400:
        return Image.asset('assets/images/09d.png', height: 100, width: 100);
      case >= 500 && < 600:
        return Image.asset('assets/images/10d.png', height: 100, width: 100);
      case >= 600 && < 700:
        return Image.asset('assets/images/13d.png', height: 100, width: 100);
      case >= 700 && < 800:
        return Image.asset('assets/images/50d.png', height: 100, width: 100);
      case == 800:
        return Image.asset('assets/images/01d.png', height: 100, width: 100);
      case > 800 && <= 804:
        return Image.asset('assets/images/04d.png', height: 100, width: 100);
      default:
        return Image.asset('assets/images/02d.png', height: 100, width: 100);
    }
  }
}
