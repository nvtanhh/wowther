import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorTheme extends Equatable {
  final String name;
  final Color primary;
  final Color secondary;

  const ColorTheme({
    required this.name,
    required this.primary,
    required this.secondary,
  });

  @override
  List<Object?> get props => [name, primary, secondary];
}
