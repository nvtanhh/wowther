import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/setting_bloc.dart';
import 'setting_page.dart';

class SettingWrapper extends StatelessWidget {
  const SettingWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(),
      child: const SettingPage(),
    );
  }
}
