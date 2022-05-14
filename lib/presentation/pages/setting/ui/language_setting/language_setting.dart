import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../common/utils/utils.index.dart';
import '../../../../../injector/injection.dart';
import '../../../../common_widgets/common_widget.index.dart';
import '../../../../common_widgets/fields/text_field.dart';
import '../../../../shared_blocs/shared_bloc_index.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({Key? key}) : super(key: key);

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  final _textLanguageController = TextEditingController();
  late List<Locale> supportedLocales;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    supportedLocales = locator<LanguageCubit>().supportedLocales;
    super.didChangeDependencies();
  }

  void _onChangeLanguage(Locale locale) {
    locator<LanguageCubit>().changeLanguage(locale);
  }

  @override
  void dispose() {
    _textLanguageController.dispose();
    super.dispose();
  }

  void _filterLanguage(String text) {
    if (text.isEmpty) {
      setState(() {
        supportedLocales = locator<LanguageCubit>().supportedLocales;
      });
      return;
    }
    setState(() {
      supportedLocales = supportedLocales
          .where(
            (item) =>
                UtilLanguage.getGlobalLanguageName(item.languageCode, context)
                    .toUpperCase()
                    .contains(text.toUpperCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: AppTextField(
              controller: _textLanguageController,
              labelText: AppLocalizations.of(context)!.settings__language_title,
              decoration: InputDecoration(
                hintText:
                    AppLocalizations.of(context)!.settings__language_search,
              ),
              onChanged: _filterLanguage,
            ),
          ),
          Expanded(
            child: BlocBuilder<LanguageCubit, Locale?>(
              builder: (context, currentLocale) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    Widget? trailing;
                    final locale = supportedLocales[index];
                    if (locale == currentLocale!) {
                      trailing = Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      );
                    }
                    return AppListTitle(
                      title: UtilLanguage.getGlobalLanguageName(
                        locale.languageCode,
                        context,
                      ),
                      trailing: trailing,
                      onPressed: () => _onChangeLanguage(locale),
                      border: locale != supportedLocales.last,
                    );
                  },
                  itemCount: supportedLocales.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: AppLocalizations.of(context)!.settings__language_change_language,
    );
  }
}
