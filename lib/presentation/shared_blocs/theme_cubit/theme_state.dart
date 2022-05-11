part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeColorEntity? theme;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final String? font;
  final DarkModeOption? darkOption;

  final List<ThemeColorEntity>? supportedThemes;
  final List<String>? supportedFonts;

  const ThemeState({
    this.theme,
    this.lightTheme,
    this.darkTheme,
    this.font,
    this.darkOption,
    this.supportedThemes,
    this.supportedFonts,
  });

  ThemeState copyWith({
    ThemeColorEntity? theme,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    String? font,
    DarkModeOption? darkOption,
    List<ThemeColorEntity>? supportedThemes,
    List<String>? supportedFonts,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      font: font ?? this.font,
      darkOption: darkOption ?? this.darkOption,
      supportedThemes: supportedThemes ?? this.supportedThemes,
      supportedFonts: supportedFonts ?? this.supportedFonts,
    );
  }

  @override
  List<Object?> get props => [
        theme,
        lightTheme,
        darkTheme,
        font,
        darkOption,
        supportedThemes,
      ];
}
