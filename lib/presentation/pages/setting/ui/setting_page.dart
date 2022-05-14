import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injector/injection.dart';
import '../../../../common/constants/constants.index.dart';
import '../../../../common/extensions/extensions.index.dart';
import '../../../../domain/entities/enums/theme_dark_option.dart';
import '../../../common_widgets/common_widget.index.dart';
import '../../../shared_blocs/theme_cubit/theme_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  void _applyDarkMode(BuildContext context, DarkModeOption darkOption) {
    locator<ThemeCubit>().onChangeTheme(darkOption: darkOption);
  }

  ///On navigation
  void onNavigate(BuildContext context, String route) {
    context.router.pushNamed(route);
  }

  Future<void> showDarkModeSetting(BuildContext context) async {
    DarkModeOption darkOption = locator<ThemeCubit>().state.darkOption!;
    showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Dark Mode'),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RadioListTile<DarkModeOption>(
                      title: Text('Dynamic'),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.dynamic,
                      groupValue: darkOption,
                      onChanged: (value) =>
                          setState(() => darkOption = DarkModeOption.dynamic),
                    ),
                    RadioListTile<DarkModeOption>(
                      title: Text('On'),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.on,
                      groupValue: darkOption,
                      onChanged: (_) =>
                          setState(() => darkOption = DarkModeOption.on),
                    ),
                    RadioListTile<DarkModeOption>(
                      title: Text('Off'),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.off,
                      groupValue: darkOption,
                      onChanged: (_) =>
                          setState(() => darkOption = DarkModeOption.off),
                    ),
                  ],
                ),
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
                    _applyDarkMode(context, darkOption);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
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
                  buildThemingWidgets(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildThemingWidgets(BuildContext context) {
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
              onPressed: () => onNavigate(context, RouteConstants.themeSetting),
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
              onPressed: () => showDarkModeSetting(context),
              trailing: Row(
                children: <Widget>[
                  Text(
                    state.darkOption!.name.capitalize(),
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
              onPressed: () => onNavigate(context, RouteConstants.fontSetting),
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
