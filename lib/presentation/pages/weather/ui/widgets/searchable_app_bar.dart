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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isSearching,
      builder: (_, bool isSearching, __) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: double.infinity,
          color: Colors.red,
          child: Row(
            children: [
              if (!isSearching) Expanded(child: _buildTimeAndPlace()),
              if (!isSearching)
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _isSearching.value = true,
                )
              else
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: AppTextField(
                      onChanged: widget.onSearch,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: AppLocalizations.of(context)!.global__search,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => _isSearching.value = false,
                        ),
                        contentPadding: EdgeInsets.zero,
                      ),
                      borderRadius: AppSpacer.radius24,
                    ),
                  ),
                ),
            ],
          ),
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
