import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/themes/resources/app_color.dart';
import 'package:weather_app/features/home/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/views/widget/weather_card.dart';
import 'package:weather_app/utils/widget/appbar.dart';
import 'package:weather_app/utils/widget/empty_state_widget.dart';
import 'package:weather_app/utils/widget/eror_state_widget.dart';
import 'package:weather_app/utils/widget/shimer_loading.dart';
import 'package:weather_app/utils/widget/snackbar.dart';

class HomePage extends StatelessWidget {
  static const String route = '/homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(text: "Weather App"),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state.status == WeatherStatus.eror) {
            KShowSnackBar(
              context: context,
              text: state.eror,
              bgColor: AppColor.redColor,
            );
          }
        },
        builder: (context, state) {
          if (state.status == WeatherStatus.loading) {
            return ListView.separated(
              itemCount: 8,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              itemBuilder: (context, index) {
                return const ShimmerLoading(
                    child: ShimmerItem(
                  width: double.infinity,
                  height: 80,
                ));
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          } else if (state.status == WeatherStatus.empty) {
            return const EmptyStateWidget();
          } else if (state.status == WeatherStatus.eror) {
            return const ErorStateWidget();
          }
          return ListView.separated(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return WeatherCard(
                item: state.data[index],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 2.5,
              );
            },
          );
        },
      ),
    );
  }
}
