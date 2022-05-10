import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/constants.index.dart';
import '../../../../common/injector/injection.dart';
import '../../../../domain/entities/enums/theme_dark_option.dart';
import '../../../common_widgets/common_widget.index.dart';
import '../../../shared_blocs/theme_cubit/theme_cubit.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  DarkOption darkOption = DarkOption.dynamic;
  bool pushNotification = false;
  bool emailNotification = false;
  bool alertLogin = false;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  void syncSetting() {}

  void _toggleDarkMode(DarkOption? value) {
    locator<ThemeCubit>().toggleDarkMode(value);
  }

  ///On navigation
  void onNavigate(String route) {
    context.router.pushNamed(route);
  }

  Future<void> showDarkModeSetting() async {
    showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        darkOption = locator<ThemeCubit>().state.darkOption!;
        return AlertDialog(
          title: Text('Dark Mode'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RadioListTile<DarkOption>(
                      title: Text('Dynamic'),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkOption.dynamic,
                      groupValue: darkOption,
                      onChanged: _toggleDarkMode,
                    ),
                    RadioListTile<DarkOption>(
                      title: Text('alwaysOn'),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkOption.alwaysOn,
                      groupValue: darkOption,
                      onChanged: (value) {
                        setState(() {
                          darkOption = DarkOption.alwaysOn;
                        });
                      },
                    ),
                    RadioListTile<DarkOption>(
                      title: Text('alwaysOff'),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkOption.alwaysOff,
                      groupValue: darkOption,
                      onChanged: (value) {
                        setState(() {
                          darkOption = DarkOption.alwaysOff;
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          actions: <Widget>[
            AppButton(
              'Close',
              onPressed: () {
                Navigator.pop(context, false);
              },
              type: ButtonType.text,
            ),
            AppButton(
              'Apply',
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('Setting'),
            pinned: true,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 8),
                  // AppListTitle(
                  //   leading: Icon(
                  //     Icons.language_outlined,
                  //     color: Theme.of(context).primaryColor,
                  //   ),
                  //   title: Translate.of(context).translate('language'),
                  //   onPressed: () {
                  //     onNavigate(Routes.changeLanguage);
                  //   },
                  //   trailing: Row(
                  //     children: <Widget>[
                  //       Text(
                  //         UtilLanguage.getGlobalLanguageName(
                  //           AppBloc.languageCubit.state.languageCode,
                  //         ),
                  //         style: Theme.of(context).textTheme.caption,
                  //       ),
                  //       const Icon(Icons.keyboard_arrow_right),
                  //     ],
                  //   ),
                  // ),
                  buildThemingWidgets(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThemingWidgets() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            AppListTitle(
              leading: Icon(
                Icons.color_lens_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: 'Theme',
              onPressed: () => onNavigate(RouteConstants.themeSetting),
              trailing: Container(
                margin: const EdgeInsets.only(right: 8),
                width: 16,
                height: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
            AppListTitle(
              leading: Icon(
                Icons.nights_stay_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: 'Dark Mode',
              onPressed: showDarkModeSetting,
              trailing: Row(
                children: <Widget>[
                  Text(
                    darkOption.name,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
            AppListTitle(
              leading: Icon(
                Icons.font_download_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: 'Font',
              onPressed: () => onNavigate(RouteConstants.fontSetting),
              trailing: Row(
                children: <Widget>[
                  Text(
                    state.font ?? '',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
              border: false,
            ),
          ],
        );
      },
    );
  }
}
