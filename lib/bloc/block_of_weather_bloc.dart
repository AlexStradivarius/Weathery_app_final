import 'package:bloc/bloc.dart';
import 'package:weather/weather.dart';
import 'block_of_weather_event.dart';
import 'block_of_weather_state.dart';

class BlockOfWeatherBloc
    extends Bloc<BlockOfWeatherEvent, BlockOfWeatherState> {
  final WeatherFactory weatherFactory;

  BlockOfWeatherBloc(this.weatherFactory) : super(BlockOfWeatherInitial()) {
    on<CollectDataByPosition>(_onCollectDataByPosition);
    on<CollectDataByCityName>(_onCollectDataByCityName);
  }

  Future<void> _onCollectDataByPosition(
    CollectDataByPosition event,
    Emitter<BlockOfWeatherState> emit,
  ) async {
    emit(BlockOfWeatherLoading());
    try {
      final weather = await weatherFactory.currentWeatherByLocation(
        event.position.latitude,
        event.position.longitude,
      );
      final forecast = await weatherFactory.fiveDayForecastByLocation(
        event.position.latitude,
        event.position.longitude,
      );
      emit(BlockOfWeatherSuccess(weather, forecast));
    } catch (e) {
      emit(BlockOfWeatherFailure(e.toString()));
    }
  }

  Future<void> _onCollectDataByCityName(
    CollectDataByCityName event,
    Emitter<BlockOfWeatherState> emit,
  ) async {
    emit(BlockOfWeatherLoading());
    try {
      final weather =
          await weatherFactory.currentWeatherByCityName(event.cityName);
      final forecast =
          await weatherFactory.fiveDayForecastByCityName(event.cityName);
      emit(BlockOfWeatherSuccess(weather, forecast));
    } catch (e) {
      emit(BlockOfWeatherFailure(e.toString()));
    }
  }
}
