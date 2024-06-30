import 'package:analytical_apex_weather_app/bloc/block_of_weather_bloc.dart';
import 'package:analytical_apex_weather_app/bloc/block_of_weather_event.dart';
import 'package:analytical_apex_weather_app/mydata.dart/api_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:analytical_apex_weather_app/screens/home_screen.dart';
import 'package:analytical_apex_weather_app/screens/different_city.dart';
import 'package:analytical_apex_weather_app/screens/contact_us.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart'; // Import the weather package

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherFactory = WeatherFactory(api_key);

    return FutureBuilder(
      future: _determinePosition(),
      builder: (context, snap) {
        if (snap.hasData) {
          return BlocProvider<BlockOfWeatherBloc>(
            create: (context) => BlockOfWeatherBloc(weatherFactory)
              ..add(CollectDataByPosition(snap.data as Position)),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const HomeScreen(),
                '/different_city': (context) => const ScreenB(),
                '/contact_us': (context) => const ScreenC(),
              },
            ),
          );
        } else {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition();
}
