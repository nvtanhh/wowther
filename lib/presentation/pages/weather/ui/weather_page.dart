import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/common_page.dart';
import '../bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      backgroundImage: 'assets/images/world-map-bg.png',
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildAppBar(context),
              _buildCurrentWeather(),
              _buildWeatherForecastByHours(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final localName = AppLocalizations.of(context)!.localeName;
    final date = DateFormat.yMMMMd(localName).format(DateTime.now());
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date),
              Row(
                children: [
                  const Icon(Icons.location_on_rounded),
                  Text(
                    'HCM',
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCurrentWeather() {
    return SizedBox();
  }

  Widget _buildWeatherForecastByHours() {
    return SizedBox();
  }
}
