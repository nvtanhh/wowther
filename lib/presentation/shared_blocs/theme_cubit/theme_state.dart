part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeEntity? theme;
  final ThemeData? lightTheme;
  final ThemeData? darkTheme;
  final String? font;
  final DarkOption? darkOption;

  final List<ThemeEntity>? supportedThemes;
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
    ThemeEntity? theme,
    ThemeData? lightTheme,
    ThemeData? darkTheme,
    String? font,
    DarkOption? darkOption,
    List<ThemeEntity>? supportedThemes,
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
