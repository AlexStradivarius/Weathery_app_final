import 'package:analytical_apex_weather_app/bloc/block_of_weather_event.dart';
import 'package:analytical_apex_weather_app/bloc/block_of_weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:analytical_apex_weather_app/bloc/block_of_weather_bloc.dart';
import 'package:analytical_apex_weather_app/widgets/appBar_widget.dart';
import 'package:analytical_apex_weather_app/widgets/background_widget.dart';
import 'package:analytical_apex_weather_app/widgets/sunrise_and_sunset_widget.dart';
import 'package:analytical_apex_weather_app/widgets/temperature_info_widget.dart';
import 'package:analytical_apex_weather_app/widgets/additional_info_widget.dart';
import 'package:analytical_apex_weather_app/widgets/five_days_forecast_widget.dart';
import 'package:analytical_apex_weather_app/widgets/weather_info_widget.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _refreshWeather() async {
    Position position = await _determinePosition();
    BlocProvider.of<BlockOfWeatherBloc>(context)
        .add(CollectDataByPosition(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Weathery',
        appBar: AppBar(),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshWeather,
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/different_city');
            },
          ),
          IconButton(
            icon: const Icon(Icons.contact_page),
            onPressed: () {
              Navigator.pushNamed(context, '/contact_us');
            },
          ),
        ],
        showBackButton: false, // No back button on the home screen
      ),
      body: BlocBuilder<BlockOfWeatherBloc, BlockOfWeatherState>(
        builder: (context, state) {
          if (state is BlockOfWeatherSuccess) {
            return Padding(
              padding:
                  const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    const BackgroundWidget(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WeatherInfo(
                              areaName: state.weather.areaName!,
                              temperature:
                                  state.weather.temperature!.celsius!.round(),
                              weatherMain: state.weather.weatherMain!,
                              date: state.weather.date!,
                              weatherConditionCode:
                                  state.weather.weatherConditionCode!,
                            ),
                            const SizedBox(height: 30),
                            SunriseSunsetInfo(
                              sunrise: state.weather.sunrise!,
                              sunset: state.weather.sunset!,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            TemperatureInfo(
                              tempMax: state.weather.tempMax!.celsius!.round(),
                              tempMin: state.weather.tempMin!.celsius!.round(),
                            ),
                            const SizedBox(height: 30),
                            AdditionalInfo(
                              windSpeed: state.weather.windSpeed!,
                              humidity: state.weather.humidity!.toInt(),
                            ),
                            const SizedBox(height: 30),
                            FiveDayForecast(forecast: state.forecast),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
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
}
