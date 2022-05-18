import '../../core/utils/utils.index.dart';
import '../../domain/entities/theme_entity.dart';

class ColorThemeModel extends ColorTheme {
  const ColorThemeModel({
    required super.name,
    required super.primary,
    required super.secondary,
  });

  factory ColorThemeModel.fromEntity(ColorTheme entity) {
    return ColorThemeModel(
      name: entity.name,
      primary: entity.primary,
      secondary: entity.secondary,
    );
  }

  factory ColorThemeModel.fromJson(Map<String, dynamic> json) {
    return ColorThemeModel(
      name: (json['name'] ?? '') as String,
      primary: UtilColor.getColorFromHex(json['primary'] as String),
      secondary: UtilColor.getColorFromHex(json['secondary'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "primary": UtilColor.getStringColor(primary),
      "secondary": UtilColor.getStringColor(secondary),
    };
  }
}
