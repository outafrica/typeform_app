// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class AppTextFieldWithTitle extends StatelessWidget {
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? title;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final bool hasTitle;
  final bool hasTitleIcon;
  final bool enabled;
  final Widget? titleIcon;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final InputBorder errorBorder;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? textFormFieldMargin;
  final TextEditingController? controller;
  final int minLines;
  final String? initialValue;
  final Color? fillColor;
  final String? helperText;

  const AppTextFieldWithTitle({
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.labelStyle,
    this.titleStyle,
    this.titleIcon,
    this.hasTitleIcon = false,
    this.title,
    this.contentPadding = const EdgeInsets.all(8),
    this.textFormFieldMargin,
    this.hasTitle = false,
    this.border = const OutlineInputBorder(
      borderSide: BorderSide(
        // color: AppColors.lightGray,
        width: 0.8,
        style: BorderStyle.none,
      ),
    ),
    this.focusedBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primaryBlue,
        width: 0.8,
        style: BorderStyle.none,
      ),
    ),
    this.enabledBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0.8,
        style: BorderStyle.none,
      ),
    ),
    this.errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 0.8,
        style: BorderStyle.solid,
      ),
    ),
    this.hintText,
    this.labelText,
    this.hasPrefixIcon = false,
    this.hasSuffixIcon = false,
    this.obscured = false,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.width,
    this.height,
    this.controller,
    this.minLines = 1,
    this.enabled = true,
    this.initialValue,
    this.fillColor,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _sc = SizeConfig(context: context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            hasTitleIcon ? titleIcon! : Container(),
            hasTitle
                ? Text(
                    title!, style: AppStyles.textStyleBodySmall(context),
                    // style: titleStyle,
                  )
                : Container(),
          ],
        ),
        hasTitle
            ? SizedBox(
                height: 1.0.h,
              )
            : Container(),
        Container(
          width: width,
          height: height,
          margin: textFormFieldMargin,
          child: TextFormField(
            style: textStyle,
            controller: controller,
            keyboardType: textInputType,
            onChanged: onChanged,
            validator: validator,
            enabled: enabled,
            minLines: minLines,
            initialValue: initialValue,
            maxLines: obscured ? 1 : minLines + 1,
            inputFormatters: inputFormatters,
            // textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              labelText: labelText,
              labelStyle: labelStyle,
              border: border,
              enabledBorder: enabledBorder,
              errorBorder: errorBorder,
              focusedBorder: focusedBorder,
              disabledBorder: enabledBorder,
              prefixIconConstraints: BoxConstraints(
                maxHeight: _sc.heightScaledSize(50)!,
                minWidth: _sc.heightScaledSize(40)!,
              ),
              prefixIcon: hasPrefixIcon ? prefixIcon : null,
              suffixIcon: hasSuffixIcon ? suffixIcon : null,
              hintText: hintText,
              fillColor: fillColor,
              helperText: helperText,
              // hintStyle: AppStyles.textStyleHint(),
            ),
            obscureText: obscured,
          ),
        ),
      ],
    );
  }
}
