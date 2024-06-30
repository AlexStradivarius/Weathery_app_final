import 'package:analytical_apex_weather_app/bloc/block_of_weather_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:analytical_apex_weather_app/bloc/block_of_weather_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  String? _searchQuery;

  void _searchWeather() {
    setState(() {
      _searchQuery = _controller.text;
    });
    if (_searchQuery != null) {
      BlocProvider.of<BlockOfWeatherBloc>(context)
          .add(CollectDataByCityName(_searchQuery!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Enter city name',
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: _searchWeather,
        ),
      ),
      onSubmitted: (value) {
        _searchWeather();
      },
    );
  }
}
