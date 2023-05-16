import 'package:flutter/material.dart';
import 'package:recipely/shared/extensions/number_extensions.dart';
import 'package:recipely/shared/typography/typography.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.isUpperCaseText = true,
    this.icon,
    this.onPressed,
    super.key,
    this.height = 50,
    this.width = 234,
    this.radius = 25,
    this.color,
    this.borderColor,
    this.textColor = Colors.white,
    this.textSize = 20.0,
    this.textAlign = TextAlign.center,
    this.fontWeight = RecipelyFontWeight.medium,
    this.leftHalfRadius = false,
    this.rightHalfRadius = false,
    this.letterSpacing = 0,
    this.isLoading = false,
    this.loaderColor,
    this.enableColor,
    this.isPrefixIcon = true,
  });

  /// text does not show if child is given.
  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? loaderColor;
  final Color? textColor;
  final Color? enableColor;
  final double textSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool isUpperCaseText;
  final double height;
  final double width;
  final double radius;
  final Color? borderColor;
  final bool leftHalfRadius;
  final bool rightHalfRadius;
  final double? letterSpacing;
  final bool isLoading;
  final bool isPrefixIcon;
  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftHalfRadius ? 0 : radius),
          right: Radius.circular(rightHalfRadius ? 0 : radius),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.transparent,
          backgroundColor: color ?? Colors.transparent,
          disabledForegroundColor: Colors.white,
          // make the button as small as possible
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(leftHalfRadius ? 0 : radius),
              bottomLeft: Radius.circular(leftHalfRadius ? 0 : radius),
              topRight: Radius.circular(rightHalfRadius ? 0 : radius),
              bottomRight: Radius.circular(rightHalfRadius ? 0 : radius),
            ),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    loaderColor ?? Colors.white,
                  ),
                  backgroundColor: loaderColor ?? Colors.white,
                ),
              )
            : icon != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (isPrefixIcon) icon!,
                        Text(
                          isUpperCaseText ? text.toUpperCase() : text,
                          textAlign: textAlign,
                          style: TextStyle(
                            color: isEnabled
                                ? (textColor ?? Colors.white)
                                : Colors.grey,
                            fontSize: textSize,
                            fontWeight: fontWeight,
                            letterSpacing: letterSpacing,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        5.horizontalGap,
                        if (!isPrefixIcon) icon!,
                      ],
                    ),
                  )
                : Text(
                    isUpperCaseText ? text : text,
                    textAlign: textAlign,
                    style: TextStyle(
                      color: (isEnabled
                          ? enableColor ?? Colors.white
                          : textColor ?? Colors.white),
                      fontSize: textSize,
                      fontWeight: fontWeight,
                      letterSpacing: letterSpacing,
                    ),
                  ),
      ),
    );
  }
}
