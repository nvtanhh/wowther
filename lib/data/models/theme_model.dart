import '../../common/utils/utils.index.dart';
import '../../domain/entities/theme_entity.dart';

class ThemeColorModel extends ThemeColorEntity {
  const ThemeColorModel({
    required super.name,
    required super.primary,
    required super.secondary,
  });

  factory ThemeColorModel.fromEntity(ThemeColorEntity entity) {
    return ThemeColorModel(
      name: entity.name,
      primary: entity.primary,
      secondary: entity.secondary,
    );
  }

  factory ThemeColorModel.fromJson(Map<String, dynamic> json) {
    return ThemeColorModel(
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
