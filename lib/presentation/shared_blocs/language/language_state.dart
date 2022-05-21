part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final List<Locale> supportedLocales;

  const LanguageState({
    required this.locale,
    required this.supportedLocales,
  });

  factory LanguageState.initial() => LanguageState(
        locale: AppConstants.supportedLocales.first,
        supportedLocales: AppConstants.supportedLocales,
      );

  LanguageState copyWith({
    Locale? locale,
    List<Locale>? supportedLocales,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
      supportedLocales: supportedLocales ?? this.supportedLocales,
    );
  }

  @override
  List<Object?> get props => [locale, supportedLocales];
}
