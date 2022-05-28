import 'package:flutter/material.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: AppIcon(AppIcons.weatherOutline),
            activeIcon: AppIcon(
              AppIcons.weather,
              color: Theme.of(context).primaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AppIcon(AppIcons.settingOutline),
            activeIcon: AppIcon(
              AppIcons.setting,
              color: Theme.of(context).primaryColor,
            ),
            label: '',
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
