import 'package:flutter/material.dart';

import '../../../../config/theme/common_page.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonPage(
      body: Center(
        child: Text('Weather Page'),
      ),
    );
  }
}
