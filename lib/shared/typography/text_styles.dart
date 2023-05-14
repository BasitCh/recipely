// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipely/shared/typography/typography.dart';

/// LocalWalkers Text Style Definitions
class RecipelyTextStyle {
  static final TextStyle _baseTextStyle = GoogleFonts.oswald(
    color: Colors.black,
  );

  //  TextStyle(
  //   fontFamily: LocalWalkersFontFamily.oswald,
  //   color: LocalWalkersColors.black,
  // );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 50,
      fontWeight: RecipelyFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 40,
      fontWeight: RecipelyFontWeight.bold,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      fontWeight: RecipelyFontWeight.extraBold,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: RecipelyFontWeight.medium,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: RecipelyFontWeight.semiBold,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 15,
      fontWeight: RecipelyFontWeight.semiBold,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: RecipelyFontWeight.medium,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: RecipelyFontWeight.semiBold,
    );
  }

  static TextStyle get subtitle3 {
    return _baseTextStyle.copyWith(
      fontSize: 13,
      fontWeight: RecipelyFontWeight.regular,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 17,
      fontWeight: RecipelyFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: RecipelyFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: RecipelyFontWeight.regular,
    );
  }

  static TextStyle get captionBold {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: RecipelyFontWeight.black,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: RecipelyFontWeight.black,
    );
  }

  // hint text style
  static TextStyle get hintStyle {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      color: Colors.grey,
      fontWeight: RecipelyFontWeight.regular,
    );
  }

  // customStyle text style
  static TextStyle get customStyle {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      color: const Color(0xFF666666),
      fontWeight: RecipelyFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: RecipelyFontWeight.medium,
      letterSpacing: 1,
      color: Colors.white,
    );
  }
}
