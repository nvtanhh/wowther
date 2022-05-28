import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../config/theme/common_page.dart';
import '../../../../config/theme/glass_container.dart';
import '../../../../config/theme/icons.dart';
import '../../../../config/theme/spacer.dart';
import '../../../../config/theme/text.dart';
import '../../../../core/extensions/extensions.index.dart';
import '../../../../domain/entities/weather.dart';
import '../bloc/weather_bloc.dart';
import 'widgets/temperature.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);
  Future<void> _onRefresh(BuildContext context) async {
    context.read<WeatherBloc>().add(
          RefreshWeather(language: AppLocalizations.of(context)?.localeName),
        );
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      backgroundImage: 'assets/images/world-map-bg.png',
      isBlurBackground: true,
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: [
                  _buildAppBar(context, state),
                  _buildCurrentWeather(context, state.weather),
                  _buildWeatherDetail(context, state.weather),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, WeatherState state) {
    final localName = AppLocalizations.of(context)!.localeName;
    final date = DateFormat.yMMMMd(localName).format(DateTime.now());
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemedText(
                date,
                type: ThemedTextType.titleMedium,
              ),
              AppSpacer.sizedBoxH8,
              if (state.weather != null)
                Row(
                  children: [
                    AppIcon(AppIcons.location),
                    ThemedText(
                      '${state.weather!.cityName}, '.toUpperCase(),
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    ThemedText(
                      state.weather!.country.toUpperCase(),
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              else
                AppIcon(AppIcons.locationOff),
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

  Widget _buildCurrentWeather(BuildContext context, Weather? weather) {
    if (weather == null) return AppSpacer.emptyBox;
    return Column(
      children: [
        AppSpacer.sizedBoxH32,
        CachedNetworkImage(
          imageUrl:
              'https://openweathermap.org/img/wn/${weather.iconCode}@4x.png',
          color: Theme.of(context).primaryColor,
          filterQuality: FilterQuality.medium,
          colorBlendMode: BlendMode.modulate,
        ),
        ThemedText(
          weather.description.capitalize(),
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        TemperatureWidget(
          weather.temperature.toStringAsFixed(0),
        ),
      ],
    );
  }

  Widget _buildWeatherDetail(
    BuildContext context,
    Weather? weather,
  ) {
    if (weather == null) return AppSpacer.emptyBox;

    return Padding(
      padding: AppSpacer.edgeInsetsVertical12,
      child: GlassContainer(
        padding: AppSpacer.edgeInsetsAll16,
        borderRadius: AppSpacer.radius16,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2,
          mainAxisSpacing: 8,
          shrinkWrap: true,
          children: <Widget>[
            _buildWeatherDetailInfo(
              context,
              AppLocalizations.of(context)!.weather__feel_like,
              '${weather.tempFeelLike} °C',
            ),
            _buildWeatherDetailInfo(
              context,
              AppLocalizations.of(context)!.weather__wind,
              '${weather.windSpeed} Km/h',
            ),
            _buildWeatherDetailInfo(
              context,
              AppLocalizations.of(context)!.weather__humidity,
              '${weather.humidity} %',
            ),
            _buildWeatherDetailInfo(
              context,
              AppLocalizations.of(context)!.weather__pressure,
              '${weather.pressure} hPa',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetailInfo(
    BuildContext context,
    String title,
    String content,
  ) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemedText(
            title,
            type: ThemedTextType.titleMedium,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.6),
                ),
          ),
          AppSpacer.sizedBoxH8,
          ThemedText(
            content,
            // type: ThemedTextType.heading6,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
