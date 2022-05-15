import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../common/theme/theme.index.dart';
import '/injector/injection.dart';
import '../../../../shared_blocs/shared_bloc_index.dart';

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
              if (item == state.font) {
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
