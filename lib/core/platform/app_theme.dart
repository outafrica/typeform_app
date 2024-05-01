// Flutter imports:
// ignore_for_file: deprecated_member_use

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/app_colors.dart';
import 'package:typeform_app/core/platform/app_strings.dart';

class AppTheme {
  static ThemeData appThemeLight = themeData();

  static const MaterialColor _materialColor = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: AppColors.primaryBlue,
      100: AppColors.primaryBlue,
      200: AppColors.primaryBlue,
      300: AppColors.primaryBlue,
      400: AppColors.primaryBlue,
      500: AppColors.primaryBlue,
      600: AppColors.primaryBlue,
      700: AppColors.primaryBlue,
      800: AppColors.primaryBlue,
      900: AppColors.primaryBlue,
    },
  );

  static ThemeData themeData() => ThemeData(
        fontFamily: AppStrings.gothamFontFamily,
        primarySwatch: _materialColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.primaryBlue,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryBlue,
        primaryColorLight: AppColors.primaryBlue,
        primaryColorDark: AppColors.primaryBlue,
        canvasColor: const Color(0xfffafafa),
        bottomAppBarColor: const Color(0xffffffff),
        cardColor: const Color(0xffffffff),
        dividerColor: AppColors.grey3,
        highlightColor: AppColors.lightSilver,
        splashColor: AppColors.accent1,
        disabledColor: AppColors.grey4,
        backgroundColor: const Color(0xffffffff),
        dialogBackgroundColor: const Color(0xffffffff),
        indicatorColor: AppColors.primaryBlue,
        hintColor: AppColors.accent2,
        errorColor: AppColors.error,
        textTheme: _textTheme,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: AppColors.fontColor,
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          helperStyle: TextStyle(
            color: AppColors.grey3,
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: AppStrings.gothamFontFamily,
            // fontStyle: FontStyle.normal,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey3,
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorStyle: TextStyle(
            color: AppColors.error,
            fontSize: 10.0.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          errorMaxLines: null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          isDense: false,
          contentPadding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 0, right: 0),
          isCollapsed: false,
          prefixStyle: const TextStyle(
            color: AppColors.black,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          suffixStyle: const TextStyle(
            color: AppColors.black,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          counterStyle: const TextStyle(
            color: AppColors.black,
            fontSize: null,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          filled: true,
          fillColor: AppColors.white,
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryRed,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryBlue,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryBlue,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryBlue,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      );

  static const _bold = FontWeight.w700;
  static const _regular = FontWeight.w400;

  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      color: AppColors.fontColor,
      fontSize: 22.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline2: TextStyle(
      color: AppColors.fontColor,
      fontSize: 20.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline3: TextStyle(
      color: AppColors.fontColor,
      fontSize: 18.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: AppColors.fontColor,
      fontSize: 16.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline5: TextStyle(
      color: AppColors.fontColor,
      fontSize: 14.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headline6: TextStyle(
      color: AppColors.fontColor,
      fontSize: 12.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle1: TextStyle(
      color: AppColors.grey4,
      fontSize: 10.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    subtitle2: TextStyle(
      color: AppColors.fontColor,
      fontSize: 9.0.sp,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    bodyText1: TextStyle(
      color: AppColors.fontColor,
      fontSize: 9.sp,
    ),
    bodyText2: TextStyle(
      color: AppColors.fontColor,
      fontSize: 8.0.sp,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
    button: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
//      fontWeight: _regular,
      fontSize: 11.0.sp,
      fontStyle: FontStyle.normal,
    ),
    caption: TextStyle(
      color: AppColors.fontColor,
      fontSize: 8.0.sp,
      fontStyle: FontStyle.normal,
      fontWeight: _regular,
    ),
    overline: TextStyle(
      color: AppColors.fontColor,
      fontSize: 8.0.sp,
      fontStyle: FontStyle.normal,
      fontWeight: _regular,
    ),
  );
}
