import 'package:flutter/material.dart';
import 'package:weather_app/utils/widget/appbar.dart';
import 'package:weather_app/utils/widget/image_load.dart';

class DetailWeatherPage extends StatelessWidget {
  static const String route = '/DetailWeatherPage';
  const DetailWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(text: "Weather Details"),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "Tuesday, July 19, 2022",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 26, height: 1.5),
          ),
          Text(
            "4:00 PM",
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
                  "32.1°C",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 48, height: 1.5),
                ),
                const ImageLoad(
                  src: 'https://openweathermap.org/img/wn/10d@2x.png',
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
              "Clouds (few clouds)",
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
                      "32.1°C",
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
                      "32.1°C",
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
