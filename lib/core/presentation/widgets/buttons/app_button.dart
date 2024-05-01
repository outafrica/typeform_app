// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class AppButton extends StatelessWidget {
  final String? label;
  final VoidCallback onTap;
  final bool isSecondary;
  final bool isDisabled;
  final bool isIconOnly;
  final Widget? prefix;
  final Widget? suffix;
  final double? width;
  final double height;
  final Widget? icon;
  final double fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final Color? color;
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;
  final double borderWidth;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final MainAxisAlignment? mainAxisAlignment;
  final double elevation;

  const AppButton({
    Key? key,
    this.label,
    required this.onTap,
    this.isSecondary = false,
    this.isDisabled = false,
    this.isIconOnly = false,
    this.prefix,
    this.suffix,
    this.width,
    this.height = 52,
    this.icon,
    this.fontSize = 14,
    this.fontColor,
    this.color,
    this.padding,
    this.borderWidth = 0,
    this.borderColor,
    this.borderRadius,
    this.mainAxisAlignment,
    this.gradient,
    this.boxShadow,
    this.elevation = 1,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return ElevatedButton(
      onPressed: isDisabled ? null : onTap,
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: isDisabled
            ? Colors.white
            : color ?? (!isSecondary ? AppColors.deepBlue : AppColors.orange),
        side: BorderSide.none,
        elevation: elevation,
        foregroundColor: fontColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        padding: padding ?? EdgeInsets.all(_sc.isWiderWidth ? 0 : 10),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.all(
                Radius.circular(_sc.heightScaledSize(8)!),
              ),
          side: BorderSide(
            width: borderWidth,
            color: borderColor ?? fontColor ?? AppColors.deepBlue,
          ),
        ),
      ),
      child: Container(
        height: _sc.heightScaledSize(height),
        width: _sc.heightScaledSize(width ?? (isIconOnly ? 64 : 131)),
        decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: boxShadow,
          border: Border.all(
            width: borderWidth,
            color: borderColor ?? fontColor ?? AppColors.deepBlue,
          ),
          borderRadius: borderRadius ??
              BorderRadius.all(
                Radius.circular(_sc.heightScaledSize(8)!),
              ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
            children: <Widget>[
              if (prefix != null && !isIconOnly)
                SizedBox(width: _sc.heightScaledSize(4)),
              if (!isIconOnly) prefix ?? const SizedBox(),
              if (!isIconOnly)
                AutoSizeText(
                  label ?? '',
                  maxLines: 1,
                  style: (fontColor == null)
                      ? _sc.buttonTextTheme
                      : _sc.buttonTextTheme.copyWith(
                          fontSize: fontSize - (_sc.isWiderWidth ? 0 : 3),
                          color: fontColor,
                          fontWeight: fontWeight,
                        ),
                ),
              if (suffix != null && !isIconOnly)
                SizedBox(width: _sc.heightScaledSize(4)),
              if (!isIconOnly) suffix ?? const SizedBox(),
              if (isIconOnly) icon ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
