import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/data/remote/api_services.dart';
import 'package:weather_app/data/remote/interceptor/dio_model.dart';
import 'package:weather_app/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState.initial()) {
    final ApiServices services = ApiServices();
    final dio = DioModel().dio;
    final weatherBox = Hive.box('weatherBox');
    final Connectivity connectivity = Connectivity();

    on<GetWeatherData>((event, emit) async {
      emit(state.copyWith(status: WeatherStatus.loading));
      var connectivityResult = await connectivity.checkConnectivity();

      // Load data from Local DB Hive
      var cachedData = weatherBox.get('weatherData');
      if (cachedData != null) {
        List<Weather> dataLocal = [];
        var rawData = jsonDecode(cachedData);
        for (var item in rawData) {
          Weather weather = Weather.fromJson(item);
          dataLocal.add(weather);
        }
        // Decode the JSON string back to a Weather object
        emit(state.copyWith(status: WeatherStatus.success, data: dataLocal));
      }

      // Check internet connectivity

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        // Fetch data from API if connected to the internet
        try {
          var response = await services.fetchWetaher(dio);
          if (response.isNotEmpty) {
            // Save the fetched data to Hive as a JSON string
            weatherBox.put('weatherData', jsonEncode(response));
            emit(state.copyWith(status: WeatherStatus.success, data: response));
          } else {
            emit(state.copyWith(
                status: WeatherStatus.empty, eror: 'Data Empty'));
          }
        } catch (error) {
          emit(state.copyWith(
              status: WeatherStatus.eror, eror: error.toString()));
        }
      }
    });
  }
}
