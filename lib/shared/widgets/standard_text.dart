import 'package:flutter/material.dart';
import 'package:recipely/shared/typography/typography.dart';

class StandardText extends StatelessWidget {
  const StandardText({
    required this.text,
    Key? key,
    this.textAlign = TextAlign.center,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.w300,
    this.fontStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.style,
    this.maxLines,
    this.overflow,
    this.height,
  }) : super(key: key);

  factory StandardText.withTheme(
    String text,
    TextStyle theme,
    Color color, {
    TextAlign align = TextAlign.center,
  }) {
    return StandardText(
      text: text,
      style: theme.copyWith(
        color: color,
      ),
      textAlign: align,
    );
  }

  factory StandardText.caption(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? decoration,
  }) {
    final TextStyle style = RecipelyTextStyle.caption.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.captionBold(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? decoration,
    String? fontFamily,
  }) {
    final TextStyle style = RecipelyTextStyle.captionBold.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: decoration,
      fontFamily: fontFamily,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  // Body
  factory StandardText.body2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration decoration = TextDecoration.none,
    String? fontFamily,
  }) {
    final TextStyle style = RecipelyTextStyle.bodyText2.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: decoration,
      fontFamily: fontFamily,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.body1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration decoration = TextDecoration.none,
    String? fontFamily,
  }) {
    final TextStyle style = RecipelyTextStyle.bodyText1.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: decoration,
      fontFamily: fontFamily,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.subtitle2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? textDecoration,
  }) {
    final TextStyle style = RecipelyTextStyle.subtitle2.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: textDecoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.subtitle1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    String? fontFamily,
    TextDecoration? decoration,
  }) {
    final TextStyle style = RecipelyTextStyle.subtitle1.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      fontFamily: fontFamily,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  // Headers
  factory StandardText.headline6(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow overflow = TextOverflow.fade,
  }) {
    final TextStyle style = RecipelyTextStyle.headline6.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.headline5(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow overflow = TextOverflow.ellipsis,
  }) {
    final TextStyle style = RecipelyTextStyle.headline5.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.headline4(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
  }) {
    final TextStyle style = RecipelyTextStyle.headline4.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory StandardText.headline3(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextOverflow? overflow,
    int? maxLines,
    TextDecoration? decoration,
  }) {
    final TextStyle style = RecipelyTextStyle.headline3.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: decoration,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.headline2(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
    TextOverflow? overflow,
  }) {
    final TextStyle style = RecipelyTextStyle.headline2.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      height: height,
      overflow: overflow,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  factory StandardText.headline1(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    Paint? paint,
    String? fontFamily,
    TextOverflow? textOverflow,
    int? maxLines,
    double? height,
  }) {
    final TextStyle style = RecipelyTextStyle.headline1.copyWith(
      fontWeight: fontWeight,
      fontSize: fontSize,
      overflow: textOverflow,
      height: height,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      maxLines: maxLines,
    );
  }

  factory StandardText.underline(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
    TextOverflow overflow = TextOverflow.ellipsis,
    double? fontSize,
    int? maxLines,
  }) {
    final TextStyle style = RecipelyTextStyle.caption.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      fontSize: fontSize,
      decoration: TextDecoration.underline,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  factory StandardText.linkUnderline(
    BuildContext context,
    String text, {
    TextAlign align = TextAlign.start,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    final TextStyle style = RecipelyTextStyle.bodyText1.copyWith(
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      decoration: TextDecoration.underline,
      fontSize: fontSize,
    );
    return StandardText(text: text, style: style, textAlign: align);
  }

  // Buttons
  factory StandardText.button(
    String text, {
    TextAlign align = TextAlign.center,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    double? letterSpacing,
    TextOverflow? overflow,
    String? fontFamily,
  }) {
    final TextStyle style = RecipelyTextStyle.button.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
      letterSpacing: letterSpacing,
      overflow: overflow ?? TextOverflow.ellipsis,
      fontFamily: fontFamily,
    );
    return StandardText(
      text: text,
      style: style,
      textAlign: align,
    );
  }

  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow ?? defaultTextStyle.overflow,
      maxLines: maxLines ?? defaultTextStyle.maxLines,
      style: style ??
          TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: textDecoration,
            fontFamily: 'Mont',
            height: height,
          ),
    );
  }
}
