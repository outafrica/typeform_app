// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import 'app_strings.dart';
import 'size_config.dart';

class AppStyles {
  // For Titles
  static TextStyle textStyleTitle() => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: AppStrings.gothamFontFamily,
        fontSize: 20.sp,
      );

  // For body texts
  static TextStyle textStyleBody(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return _sc.h5Theme.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontFamily: AppStrings.gothamFontFamily,
      fontSize: 11.1.sp,
    );
  }

  // For body texts
  static TextStyle textStyleBodyTitle(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return _sc.h5Theme.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: AppStrings.gothamFontFamily,
      fontSize: 12.5.sp,
    );
  }

  static TextStyle textStyleBodySmall(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return _sc.body1Theme.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: AppStrings.gothamFontFamily,
      fontSize: 11.sp,
    );
  }

  static TextStyle textStyleInput(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return _sc.body1Theme.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontFamily: AppStrings.gothamFontFamily,
      fontSize: 10.sp,
    );
  }
}
