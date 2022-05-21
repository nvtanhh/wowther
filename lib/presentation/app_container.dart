import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/theme/icons.dart';
import 'pages/setting/ui/setting_wrapper.dart';
import 'pages/weather/ui/weather_wrapper.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer>
    with WidgetsBindingObserver {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    ///AppState add observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ///Handle AppState
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {}
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const <Widget>[
          TodoWrapper(),
          SettingWrapper(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: AppIcon(AppIcons.weather),
            label: AppLocalizations.of(context)!.weather__title,
          ),
          BottomNavigationBarItem(
            icon: AppIcon(AppIcons.setting),
            label: AppLocalizations.of(context)!.settings__title,
          ),
        ],
        selectedFontSize: 12,
        unselectedFontSize: 10,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
