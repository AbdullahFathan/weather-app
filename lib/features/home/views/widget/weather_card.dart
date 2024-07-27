import 'package:flutter/material.dart';
import 'package:weather_app/utils/widget/image_load.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Row(
        children: [
          const ImageLoad(src: 'https://openweathermap.org/img/wn/10d@2x.png'),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tue, Jul 19, 2022, 4:00 PM",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 16, height: 1.5),
              ),
              Text(
                "Clouds",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14, height: 1.5),
              ),
              Text(
                "Temp: 32.1°C",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14, height: 1.5),
              ),
            ],
          )
        ],
      ),
    );
  }
}
