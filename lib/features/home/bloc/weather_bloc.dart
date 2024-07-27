import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/data/remote/api_services.dart';
import 'package:weather_app/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.initial()) {
    final ApiServices services = ApiServices();
    on<GetWeatherData>((event, emit) async {
      emit(state.copyWith(status: WeatherStatus.loading));
      try {
        var response = await services.fetchWetaher();
        response.isNotEmpty
            ? emit(
                state.copyWith(status: WeatherStatus.success, data: response))
            : emit(state.copyWith(
                status: WeatherStatus.empty, eror: 'Data Empty'));
      } catch (eror) {
        emit(state.copyWith(status: WeatherStatus.eror, eror: eror.toString()));
      }
    });
  }
}
