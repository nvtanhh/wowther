import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_resources/data/models/app_theme_data_model.dart';
import 'package:flutter_resources/data/models/theme_model.dart';
import 'package:flutter_resources/domain/entities/app_theme_data.dart';
import 'package:flutter_resources/domain/entities/enums/theme_dark_option.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const appThemeDataModel = AppThemeDataModel(
    colorTheme: ColorThemeModel(
      name: 'orange',
      primary: Color(0xffff9800),
      secondary: Color(0xffff9800),
    ),
    font: 'Open Sans',
    darkOption: DarkModeOption.dynamic,
  );

  test(
    "should be a subclass of AppThemeData",
    () {
      expect(appThemeDataModel, isA<AppThemeData>());
    },
  );

  group(' ', () {
    test(
      "should return a valid AppThemeDataModel when from json ",
      () async {
        // arrange
        final Map<String, dynamic> json =
            jsonDecode(fixture('theme/app_theme.json')) as Map<String, dynamic>;
        // act
        final result = AppThemeDataModel.fromJson(json);

        // assert
        expect(result, appThemeDataModel);
      },
    );
  });

  group('toJson', () {
    test(
      "should return the JSON map ",
      () async {
        // act
        final result = appThemeDataModel.toJson();

        final expectedJson = {
          "colorTheme": {
            "name": "orange",
            "primary": "ffff9800",
            "secondary": "ffff9800"
          },
          "font": "Open Sans",
          "darkOption": "dynamic"
        };

        // assert
        expect(result, expectedJson);
      },
    );
  });

  group('from json <=> to Json', () {
    test(
      "should return valid model when fromJson with toJson",
      () async {
        // arrange
        final Map<String, dynamic> json =
            jsonDecode(fixture('theme/app_theme.json')) as Map<String, dynamic>;
        // act
        final result = AppThemeDataModel.fromJson(json);

        // assert
        final expectedJson = json;
        expect(result.toJson(), expectedJson);
      },
    );
  });
}
