import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/detail_weather/views/detail_weather_page.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/widget/image_load.dart';

class WeatherCard extends StatelessWidget {
  final Weather item;
  const WeatherCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('E, MMM d, yyyy, h:mm a').format(item.dtTxt!);
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        DetailWeatherPage.route,
        arguments: item,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Row(
          children: [
            ImageLoad(
                src:
                    'https://openweathermap.org/img/wn/${item.weather?[0].icon}@2x.png'),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, height: 1.5),
                ),
                Text(
                  "${item.weather?[0].main}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, height: 1.5),
                ),
                Text(
                  "Temp: ${item.main?.temp}°C",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, height: 1.5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
