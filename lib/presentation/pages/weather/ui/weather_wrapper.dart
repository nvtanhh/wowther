import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configs/configs.index.dart';
import '../bloc/weather_bloc.dart';
import 'weather_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoWrapper extends StatelessWidget {
  const TodoWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<WeatherBloc>()
        ..add(
          WeatherInitialEvent(
            language: AppLocalizations.of(context)!.localeName,
          ),
        ),
      child: const WeatherPage(),
    );
  }
}
