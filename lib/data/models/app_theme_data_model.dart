import '../../domain/entities/app_theme_data.dart';
import '../../domain/entities/enums/theme_dark_option.dart';
import 'theme_model.dart';

class AppThemeDataModel extends AppThemeDataEntity {
  const AppThemeDataModel({
    required super.colorTheme,
    required super.font,
    required super.darkOption,
  });

  factory AppThemeDataModel.fromEntity(AppThemeDataEntity entity) {
    return AppThemeDataModel(
      colorTheme: ThemeColorModel.fromEntity(entity.colorTheme),
      font: entity.font,
      darkOption: entity.darkOption,
    );
  }

  factory AppThemeDataModel.fromJson(Map<String, dynamic> json) {
    return AppThemeDataModel(
      colorTheme:
          ThemeColorModel.fromJson(json['colorTheme'] as Map<String, dynamic>),
      font: json['font'] as String,
      darkOption: DarkModeOption.values.firstWhere(
        (element) => element.name == json['darkOption'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "colorTheme": (colorTheme as ThemeColorModel).toJson(),
      "font": font,
      "darkOption": darkOption.name,
    };
  }
}
