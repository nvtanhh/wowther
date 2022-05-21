part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final AppThemeData? theme;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;

  final List<ColorTheme>? supportedColorThemes;
  final List<String>? supportedFonts;

  const ThemeState({
    this.theme,
    this.lightTheme,
    this.darkTheme,
    this.supportedColorThemes,
    this.supportedFonts,
  });

  DarkModeOption get darkOption => theme?.darkOption ?? DarkModeOption.dynamic;

  ThemeState copyWith({
    AppThemeData? theme,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    List<ColorTheme>? supportedThemes,
    List<String>? supportedFonts,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      supportedColorThemes: supportedThemes ?? supportedColorThemes,
      supportedFonts: supportedFonts ?? this.supportedFonts,
    );
  }

  @override
  List<Object?> get props => [
        theme,
        lightTheme,
        darkTheme,
        supportedColorThemes,
      ];
}
