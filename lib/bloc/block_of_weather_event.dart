import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class BlockOfWeatherEvent extends Equatable {
  const BlockOfWeatherEvent();
}

class CollectDataByPosition extends BlockOfWeatherEvent {
  final Position position;

  const CollectDataByPosition(this.position);

  @override
  List<Object> get props => [position];
}

class CollectDataByCityName extends BlockOfWeatherEvent {
  final String cityName;

  const CollectDataByCityName(this.cityName);

  @override
  List<Object> get props => [cityName];
}
