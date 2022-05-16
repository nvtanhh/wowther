import 'package:equatable/equatable.dart';

import 'enums/theme_dark_option.dart';
import 'theme_entity.dart';

class AppThemeDataEntity extends Equatable {
  final ThemeColorEntity colorTheme;
  final String font;
  final DarkModeOption darkOption;

  const AppThemeDataEntity({
    required this.colorTheme,
    required this.font,
    required this.darkOption,
  });

  @override
  List<Object?> get props => [colorTheme, font, darkOption];
}
