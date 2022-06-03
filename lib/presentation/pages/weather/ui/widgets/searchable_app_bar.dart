import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../../../config/theme/fields/text_field.dart';
import '../../../../../config/theme/icons.dart';
import '../../../../../config/theme/spacer.dart';
import '../../../../../config/theme/text.dart';
import '../../../../../domain/entities/weather.dart';

class SearchableWeatherAppBar extends StatefulWidget {
  final Weather weather;
  final void Function(String) onSearch;
  const SearchableWeatherAppBar({
    Key? key,
    required this.weather,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<SearchableWeatherAppBar> createState() =>
      _SearchableWeatherAppBarState();
}

class _SearchableWeatherAppBarState extends State<SearchableWeatherAppBar> {
  final ValueNotifier<bool> _isSearching = ValueNotifier<bool>(false);
  static const Duration _searchAnimationDuration = Duration(milliseconds: 300);

  void _onSubmitted(String value) {
    _isSearching.value = false;
    widget.onSearch(value);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return ValueListenableBuilder(
          valueListenable: _isSearching,
          builder: (_, bool isSearching, __) {
            return Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  opacity: !isSearching ? 1 : 0,
                  duration: _searchAnimationDuration,
                  curve: Curves.easeInOutSine,
                  child: _buildTimeAndPlace(),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: _searchAnimationDuration,
                    alignment: Alignment.centerRight,
                    width: isSearching ? constraints.maxWidth : 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: isSearching
                                ? AppTextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: AppLocalizations.of(context)!
                                          .global__search,
                                      suffixIcon: GestureDetector(
                                        onTap: () => _isSearching.value = false,
                                        child: AppIcon(
                                          AppIcons.close,
                                          color: Theme.of(context)
                                              .inputDecorationTheme
                                              .suffixIconColor,
                                        ),
                                      ),
                                    ),
                                    borderRadius: AppSpacer.radius24,
                                    onSubmitted: _onSubmitted,
                                    autofocus: true,
                                  )
                                : null,
                          ),
                        ),
                        if (!isSearching)
                          GestureDetector(
                            onTap: () => _isSearching.value = true,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 14.0),
                              child: AppIcon(AppIcons.search),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildTimeAndPlace() {
    final localName = AppLocalizations.of(context)!.localeName;
    final date = DateFormat.yMMMMd(localName).format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ThemedText(
          date,
          type: ThemedTextType.titleMedium,
        ),
        AppSpacer.sizedBoxH8,
        Row(
          children: [
            Transform.translate(
              offset: const Offset(-4.0, 0),
              child: AppIcon(AppIcons.location),
            ),
            ThemedText(
              '${widget.weather.cityName}, '.toUpperCase(),
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            ThemedText(
              widget.weather.country.toUpperCase(),
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        )
      ],
    );
  }
}
