import 'package:flutter/material.dart';
import 'package:flutter_resources/data/models/theme_model.dart';
import 'package:flutter_resources/domain/entities/color_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const colorThemeModel = ColorThemeModel(
    name: 'orange',
    primary: Colors.orange,
    secondary: Colors.orange,
  );

  test(
    "should be a subclass of ColorTheme",
    () {
      expect(colorThemeModel, isA<ColorTheme>());
    },
  );
}
