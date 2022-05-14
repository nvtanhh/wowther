import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/injector/injection.dart';
import '../../../../common/constants/constants.index.dart';
import '../../../../common/extensions/extensions.index.dart';
import '../../../../common/utils/utils.index.dart';
import '../../../../domain/entities/enums/theme_dark_option.dart';
import '../../../common_widgets/common_widget.index.dart';
import '../../../shared_blocs/shared_bloc_index.dart';

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
              title: Text(
                AppLocalizations.of(context)!.settings__title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RadioListTile<DarkModeOption>(
                      title: Text(
                        AppLocalizations.of(context)!
                            .settings__theme_dark_mode_dynamic,
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.dynamic,
                      groupValue: darkOption,
                      onChanged: (value) =>
                          setState(() => darkOption = DarkModeOption.dynamic),
                    ),
                    RadioListTile<DarkModeOption>(
                      title: Text(
                        AppLocalizations.of(context)!
                            .settings__theme_dark_mode_on,
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.on,
                      groupValue: darkOption,
                      onChanged: (_) =>
                          setState(() => darkOption = DarkModeOption.on),
                    ),
                    RadioListTile<DarkModeOption>(
                      title: Text(
                        AppLocalizations.of(context)!
                            .settings__theme_dark_mode_off,
                      ),
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
                  AppLocalizations.of(context)!.global__close,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  type: ButtonType.text,
                ),
                AppButton(
                  AppLocalizations.of(context)!.global__apply,
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
            title: Text(
              AppLocalizations.of(context)!.settings__title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            pinned: true,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 8),
                  AppListTitle(
                    leading: Icon(
                      Icons.language_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    title:
                        AppLocalizations.of(context)!.settings__language_title,
                    onPressed: () {
                      onNavigate(context, RouteConstants.languageSetting);
                    },
                    trailing: BlocBuilder<LanguageCubit, Locale?>(
                      builder: (context, locale) {
                        return Row(
                          children: <Widget>[
                            Text(
                              UtilLanguage.getGlobalLanguageName(
                                locale!.languageCode,
                                context,
                              ),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            const Icon(Icons.keyboard_arrow_right),
                          ],
                        );
                      },
                    ),
                  ),
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
              title: AppLocalizations.of(context)!.settings__theme_color,
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
              title: AppLocalizations.of(context)!.settings__theme_dark_mode,
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
              title: AppLocalizations.of(context)!.settings__theme_font,
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
