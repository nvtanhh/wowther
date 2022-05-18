import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../config/injector/injection.dart';
import '../../../../../config/theme/common_app_bar.dart';
import '../../../../../config/theme/common_page.dart';
import '../../../../../config/theme/list_title.dart';
import '../../../../shared_blocs/theme/theme_cubit.dart';

class FontSettingPage extends StatelessWidget {
  const FontSettingPage({Key? key}) : super(key: key);

  void _onChange(String font) {
    locator<ThemeCubit>().onChangeTheme(font: font);
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      appBar: CommonAppBar(
        title: AppLocalizations.of(context)!.settings__theme_font,
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              Widget? trailing;
              final item = state.supportedFonts![index];
              if (item == state.theme!.font) {
                trailing = Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                );
              }
              return AppListTitle(
                title: item,
                trailing: trailing,
                border: item != state.supportedFonts!.last,
                onPressed: () => _onChange(item),
              );
            },
            itemCount: state.supportedFonts?.length ?? 0,
          );
        },
      ),
    );
  }
}
