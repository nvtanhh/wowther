import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/injector/injection.dart';
import '../bloc/weather_bloc.dart';
import 'weather_page.dart';

class TodoWrapper extends StatelessWidget {
  const TodoWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<WeatherBloc>(),
      child: const WeatherPage(),
    );
  }
}
