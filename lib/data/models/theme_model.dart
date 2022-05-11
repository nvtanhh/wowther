import 'package:flutter/material.dart';

import '../../common/utils/utils.index.dart';
import '../../domain/entities/theme_entity.dart';

class ThemeColorModel extends ThemeColorEntity {
  ThemeColorModel({
    required String name,
    required Color primary,
    required Color secondary,
  }) : super(
          name: name,
          primary: primary,
          secondary: secondary,
        );

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
