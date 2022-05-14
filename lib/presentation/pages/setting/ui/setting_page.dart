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
              title: ThemedText(
                AppLocalizations.of(context)!.settings__theme_dark_mode,
                type: ThemedTextType.titleMedium,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RadioListTile<DarkModeOption>(
                      title: ThemedText(
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
                      title: ThemedText(
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
                      title: ThemedText(
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
      appBar: CommonAppBar(
        title: AppLocalizations.of(context)!.settings__title,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSpacer.sizedBoxH8,
            AppListTitle(
              leading: Icon(
                Icons.language_outlined,
                color: Theme.of(context).primaryColor,
              ),
              title: AppLocalizations.of(context)!.settings__language_title,
              onPressed: () {
                onNavigate(context, RouteConstants.languageSetting);
              },
              trailing: BlocBuilder<LanguageCubit, Locale?>(
                builder: (context, locale) {
                  return Row(
                    children: <Widget>[
                      ThemedText(
                        UtilLanguage.getGlobalLanguageName(
                          locale!.languageCode,
                          context,
                        ),
                        type: ThemedTextType.caption,
                      ),
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  );
                },
              ),
            ),
            _buildThemingWidgets(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemingWidgets(BuildContext context) {
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
                margin: AppSpacer.edgeInsetsRight8,
                width: 16.0,
                height: 16.0,
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
                  ThemedText(
                    state.darkOption!.name.capitalize(),
                    type: ThemedTextType.caption,
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
                  ThemedText(
                    state.font ?? '',
                    type: ThemedTextType.caption,
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
