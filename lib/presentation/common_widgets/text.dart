import 'package:flutter/material.dart';

class ThemedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final ThemedTextType type;

  const ThemedText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.type = ThemedTextType.bodyMedium,
  }) : super(key: key);

  static TextStyle getTextStyle(BuildContext context, ThemedTextType type) {
    switch (type) {
      case ThemedTextType.heading6:
        return Theme.of(context).textTheme.headline6!;
      case ThemedTextType.headingLarge:
        return Theme.of(context).textTheme.headlineLarge!;
      case ThemedTextType.headingMedium:
        return Theme.of(context).textTheme.headlineMedium!;
      case ThemedTextType.headingSmall:
        return Theme.of(context).textTheme.headlineSmall!;
      case ThemedTextType.titleLarge:
        return Theme.of(context).textTheme.titleLarge!;
      case ThemedTextType.titleMedium:
        return Theme.of(context).textTheme.titleMedium!;
      case ThemedTextType.titleSmall:
        return Theme.of(context).textTheme.titleSmall!;
      case ThemedTextType.subTitle1:
        return Theme.of(context).textTheme.subtitle1!;
      case ThemedTextType.subTitle2:
        return Theme.of(context).textTheme.subtitle2!;
      case ThemedTextType.labelLarge:
        return Theme.of(context).textTheme.labelLarge!;
      case ThemedTextType.labelMedium:
        return Theme.of(context).textTheme.labelMedium!;
      case ThemedTextType.labelSmall:
        return Theme.of(context).textTheme.labelSmall!;
      case ThemedTextType.bodyLarge:
        return Theme.of(context).textTheme.bodyLarge!;
      case ThemedTextType.bodyMedium:
        return Theme.of(context).textTheme.bodyMedium!;
      case ThemedTextType.bodySmall:
        return Theme.of(context).textTheme.bodySmall!;
      case ThemedTextType.button:
        return Theme.of(context).textTheme.button!;
      case ThemedTextType.caption:
        return Theme.of(context).textTheme.caption!;
      case ThemedTextType.overline:
        return Theme.of(context).textTheme.overline!;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle themedTextStyle = getTextStyle(context, type);

    if (style != null) {
      themedTextStyle = themedTextStyle.merge(style);
    }

    return Text(
      text,
      style: themedTextStyle,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

enum ThemedTextType {
  heading6,
  headingLarge,
  headingMedium,
  headingSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  subTitle1,
  subTitle2,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  button,
  caption,
  overline,
}
