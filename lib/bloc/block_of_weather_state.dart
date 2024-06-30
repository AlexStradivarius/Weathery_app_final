import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';

abstract class BlockOfWeatherState extends Equatable {
  const BlockOfWeatherState();

  @override
  List<Object> get props => [];
}

class BlockOfWeatherInitial extends BlockOfWeatherState {}

class BlockOfWeatherLoading extends BlockOfWeatherState {}

class BlockOfWeatherSuccess extends BlockOfWeatherState {
  final Weather weather;
  final List<Weather> forecast;

  const BlockOfWeatherSuccess(this.weather, this.forecast);

  @override
  List<Object> get props => [weather, forecast];
}

class BlockOfWeatherFailure extends BlockOfWeatherState {
  final String error;

  const BlockOfWeatherFailure(this.error);

  @override
  List<Object> get props => [error];
}
