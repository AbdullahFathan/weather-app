import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/remote/api_services.dart';
import 'package:weather_app/models/weather.dart';

import 'api_services_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late ApiServices apiServices;
  late MockDio mockDio;

  setUpAll(() async {
    await dotenv.load(fileName: '.env');
  });

  setUp(() {
    mockDio = MockDio();
    apiServices = ApiServices();
  });

  group('fetchWeather', () {
    test('returns a list of Weather if the http call completes successfully',
        () async {
      final jsonResponse = jsonEncode({
        'list': [
          {
            'main': {'temp': 30.0},
            'weather': [
              {'description': 'clear sky', 'icon': '01d'}
            ],
            'dt_txt': '2024-07-28 15:00:00'
          }
        ]
      });

      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
          data: jsonDecode(jsonResponse),
          statusCode: 200,
          requestOptions: RequestOptions(path: '')));

      final weatherList = await apiServices.fetchWetaher(mockDio);

      expect(weatherList, isA<List<Weather>>());
      expect(weatherList.length, 1);
      expect(weatherList[0].main?.temp, 30.0);
      expect(weatherList[0].weather?[0].description, 'clear sky');
    });

    test('throws an exception if the http call completes with an error',
        () async {
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer(
        (_) async => Response(
          data: 'Not Found',
          statusCode: 404,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      try {
        await apiServices.fetchWetaher(mockDio);
        fail('Expected an exception to be thrown');
      } catch (e) {
        expect(e, isA<String>());
      }
    });
  });
}
