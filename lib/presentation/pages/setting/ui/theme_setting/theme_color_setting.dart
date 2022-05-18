import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../config/injector/injection.dart';
import '../../../../../config/theme/common_app_bar.dart';
import '../../../../../config/theme/common_page.dart';
import '../../../../../config/theme/list_title.dart';
import '../../../../../core/extensions/extensions.index.dart';
import '../../../../../domain/entities/theme_entity.dart';
import '../../../../shared_blocs/theme/theme_cubit.dart';

class ThemeColorSettingPage extends StatelessWidget {
  const ThemeColorSettingPage({Key? key}) : super(key: key);

  void _onChange(ColorTheme theme, {required BuildContext context}) {
    locator<ThemeCubit>().onChangeTheme(theme: theme);
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      appBar: CommonAppBar(
        title: AppLocalizations.of(context)!.settings__theme_color,
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                Widget trailing = const SizedBox();
                final item = state.supportedThemes![index];
                if (item.name == state.theme!.colorTheme.name) {
                  trailing = Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                  );
                }

                return AppListTitle(
                  title: item.name.capitalize(),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: item.primary,
                  ),
                  trailing: trailing,
                  onPressed: () => _onChange(item, context: context),
                  border: item != state.supportedThemes!.last,
                );
              },
              itemCount: state.supportedThemes?.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}
