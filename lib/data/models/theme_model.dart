import 'package:flutter/material.dart';
import 'package:flutter_resources/domain/entities/theme_entity.dart';

import '../../common/utils/utils.index.dart';

class ThemeModel extends ThemeEntity {
  ThemeModel({
    required String name,
    required Color primary,
    required Color secondary,
  }) : super(
          name: name,
          primary: primary,
          secondary: secondary,
        );

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
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
