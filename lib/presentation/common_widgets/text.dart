import 'package:flutter/material.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final ThemedTextSize size;

  const ThemedText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.size = ThemedTextSize.medium,
  }) : super(key: key);

  static TextStyle getTextStyle(BuildContext context, ThemedTextSize size) {
    switch (size) {
      case ThemedTextSize.extraSmall:
        return Theme.of(context).textTheme.overline!;
      case ThemedTextSize.small:
        return Theme.of(context).textTheme.caption!;
      case ThemedTextSize.mediumSecondary:
        return Theme.of(context).textTheme.bodyText1!;
      case ThemedTextSize.medium:
        return Theme.of(context).textTheme.bodyMedium!;
      case ThemedTextSize.large:
        return Theme.of(context).textTheme.titleMedium!;
      case ThemedTextSize.extraLarge:
        return Theme.of(context).textTheme.headline5!;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themedTextStyle = getTextStyle(context, size);

    if (style != null) {
      themedTextStyle = themedTextStyle.merge(style);
    }

    return ThemedText(
      text,
      style: themedTextStyle,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

enum ThemedTextSize {
  extraSmall,
  small,
  mediumSecondary,
  medium,
  large,
  extraLarge
}
