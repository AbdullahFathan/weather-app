import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/utils/widget/appbar.dart';
import 'package:weather_app/utils/widget/image_load.dart';

class DetailWeatherPage extends StatelessWidget {
  static const String route = '/DetailWeatherPage';
  final Weather item;
  const DetailWeatherPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(item.dtTxt!);
    String formattedTime = DateFormat('h:mm a').format(item.dtTxt!);
    return Scaffold(
      appBar: const PrimaryAppBar(text: "Weather Details"),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            formattedDate,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 26, height: 1.5),
          ),
          Text(
            formattedTime,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 22, height: 1.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${item.main?.temp}°C",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 48, height: 1.5),
                ),
                ImageLoad(
                  src:
                      'https://openweathermap.org/img/wn/${item.weather?[0].icon}@2x.png',
                  height: 120,
                  width: 170,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Text(
              "${item.weather?[0].main} (${item.weather?[0].description})",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18, height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Temp (min)",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14, height: 1.5),
                    ),
                    Text(
                      "${item.main?.tempMin}°C",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 18, height: 2),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Temp (max)",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14, height: 1.5),
                    ),
                    Text(
                      "${item.main?.tempMax}°C",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 18, height: 2),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
