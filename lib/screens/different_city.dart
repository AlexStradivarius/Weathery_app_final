import 'package:analytical_apex_weather_app/bloc/block_of_weather_state.dart';
import 'package:analytical_apex_weather_app/widgets/search_by_city_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:analytical_apex_weather_app/bloc/block_of_weather_bloc.dart';
import 'package:analytical_apex_weather_app/widgets/appBar_widget.dart';
import 'package:analytical_apex_weather_app/widgets/background_widget.dart';
import 'package:analytical_apex_weather_app/widgets/search_bar_widget.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'Search a City',
        appBar: AppBar(),
        actions: [],
      ),
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight + 20, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundWidget(),
              Column(
                children: [
                  const SizedBox(height: 30),
                  const SearchBarWidget(),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<BlockOfWeatherBloc, BlockOfWeatherState>(
                      builder: (context, state) {
                        if (state is BlockOfWeatherSuccess) {
                          return Column(
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                '🌎 ${state.weather.areaName}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SearchByCityWidget(weather: state.weather),
                            ],
                          );
                        } else if (state is BlockOfWeatherLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return const Center(
                            child: Text(
                              'No weather data available',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
