part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, success, empty, eror }

class WeatherState extends Equatable {
  const WeatherState({
    required this.data,
    required this.status,
    required this.eror,
  });

  final WeatherStatus status;
  final String eror;

  final List<Weather> data;

  factory WeatherState.initial() => const WeatherState(
        data: [],
        status: WeatherStatus.initial,
        eror: "",
      );

  @override
  List<Object> get props => [data, status, eror];

  WeatherState copyWith({
    List<Weather>? data,
    WeatherStatus? status,
    String? eror,
  }) {
    return WeatherState(
      data: data ?? this.data,
      status: status ?? this.status,
      eror: eror ?? this.eror,
    );
  }
}
