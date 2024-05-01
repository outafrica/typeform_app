// Flutter imports:
// ignore_for_file: deprecated_member_use

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class AppTextFields extends StatefulWidget {
  final TextInputType? keyboard;
  final TextEditingController? controller;
  final String? hintText;
  final bool isObscure;
  final bool enabled;
  final bool isHint;
  final bool autocorrect;
  final bool multiline;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final bool autoFocus;
  final TextStyle? textFieldStyle;
  final TextStyle? hintTextStyle;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledborder;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  final ValueChanged<String>? onSubmitted;
  final EdgeInsetsGeometry padding;

  final Color? fillColor;
  final String? helperText;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final String? initialValue;

  const AppTextFields({
    super.key,
    this.keyboard,
    this.maxLength,
    this.textFieldStyle,
    this.hintTextStyle,
    this.suffix,
    this.prefix,
    this.autoFocus = false,
    this.validator,
    this.inputFormatters,
    this.isObscure = false,
    this.multiline = false,
    this.enabled = true,
    this.autocorrect = true,
    this.hintText,
    this.controller,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.focusNode,
    this.padding = const EdgeInsets.all(8),
    this.border,
    this.focusedBorder,
    this.enabledborder,
    this.isHint = true,
    this.fillColor,
    this.helperText,
    this.textInputAction,
    this.textAlignVertical,
    this.initialValue,
  });

  @override
  _AppTextFieldsState createState() => _AppTextFieldsState();
}

class _AppTextFieldsState extends State<AppTextFields> {
  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autoFocus,
      obscureText: widget.isObscure,
      textInputAction: widget.textInputAction,
      keyboardAppearance: Brightness.dark,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      style: widget.textFieldStyle ??
          AppStyles.textStyleInput(context).copyWith(
            fontSize: _sc.heightScaledSize(16),
            color: AppColors.deepBlack,
          ),
      textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
      obscuringCharacter: '●',
      keyboardType: widget.keyboard,
      maxLength: widget.maxLength,
      minLines: widget.multiline ? null : 1,
      /** widget.minLines**/
      maxLines: widget.multiline ? null : 1,
      /** widget.maxLines**/
      expands: widget.multiline,
      validator: widget.validator,
      onEditingComplete: widget.onEditingComplete,
      inputFormatters: widget.inputFormatters ??
          (widget.keyboard == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : []),
      enabled: widget.enabled,
      autocorrect: widget.autocorrect,
      cursorColor: AppColors.primaryBlue,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        hintText: widget.isHint ? widget.hintText : null,
        suffixIcon: widget.suffix,
        contentPadding: widget.padding,
        prefixIcon: widget.prefix,
        prefixIconConstraints: BoxConstraints(
          maxHeight: _sc.heightScaledSize(50)!,
          maxWidth: _sc.heightScaledSize(50)!,
        ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: _sc.heightScaledSize(50)!,
          maxWidth: _sc.heightScaledSize(50)!,
        ),
        labelText: !widget.isHint ? widget.hintText : null,
        labelStyle: widget.hintTextStyle,
        hintStyle: widget.hintTextStyle,
        fillColor: widget.fillColor, // Colors.transparent,
        filled: true,
        border: widget.border,
        helperText: widget.helperText,
        helperMaxLines: 2,
        errorMaxLines: 2,
        focusedBorder: widget.focusedBorder,
        enabledBorder: widget.enabledborder,
        // errorBorder: InputBorder.none,
        disabledBorder: widget.enabledborder,
      ),
    );
  }
}
