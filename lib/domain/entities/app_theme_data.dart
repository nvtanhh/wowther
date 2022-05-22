import 'package:equatable/equatable.dart';

import 'enums/theme_dark_option.dart';
import 'color_theme.dart';

class AppThemeData extends Equatable {
  final ColorTheme colorTheme;
  final String font;
  final DarkModeOption darkOption;

  const AppThemeData({
    required this.colorTheme,
    required this.font,
    required this.darkOption,
  });

  @override
  List<Object?> get props => [colorTheme, font, darkOption];
}
