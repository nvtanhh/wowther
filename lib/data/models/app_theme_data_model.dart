import '../../domain/entities/app_theme_data.dart';
import '../../domain/entities/enums/theme_dark_option.dart';
import 'theme_model.dart';

class AppThemeDataModel extends AppThemeData {
  const AppThemeDataModel({
    required super.colorTheme,
    required super.font,
    required super.darkOption,
  });

  factory AppThemeDataModel.fromEntity(AppThemeData entity) {
    return AppThemeDataModel(
      colorTheme: ColorThemeModel.fromEntity(entity.colorTheme),
      font: entity.font,
      darkOption: entity.darkOption,
    );
  }

  factory AppThemeDataModel.fromJson(Map<String, dynamic> json) {
    return AppThemeDataModel(
      colorTheme:
          ColorThemeModel.fromJson(json['colorTheme'] as Map<String, dynamic>),
      font: json['font'] as String,
      darkOption: DarkModeOption.values.firstWhere(
        (element) => element.name == json['darkOption'] as String,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "colorTheme": (colorTheme as ColorThemeModel).toJson(),
      "font": font,
      "darkOption": darkOption.name,
    };
  }
}
