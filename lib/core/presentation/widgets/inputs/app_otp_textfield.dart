// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:sizer/sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class AppOtpTextField extends StatefulWidget {
  final int itemCount;
  final ValueChanged<String?>? onChanged;
  final ValueChanged<String?>? onCompleted;
  final TextEditingController? controller;
  final String? initialCode;
  final bool autoFocus;
  final FocusNode? focusNode;

  const AppOtpTextField({
    super.key,
    this.itemCount = 6,
    required this.onChanged,
    required this.controller,
    this.onCompleted,
    this.initialCode = '',
    this.autoFocus = false,
    this.focusNode,
  });

  @override
  State<AppOtpTextField> createState() => _AppOtpTextFieldState();
}

class _AppOtpTextFieldState extends State<AppOtpTextField> {
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context: context);

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          filled: false,
        ),
      ),
      child: PinFieldAutoFill(
        codeLength: widget.itemCount,
        textInputAction: TextInputAction.done,
        // autoFocus: widget.autoFocus,
        enableInteractiveSelection: true,
        currentCode: widget.initialCode,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        cursor: Cursor(
          color: AppColors.orange,
          enabled: true,
          width: 1,
        ),
        controller: widget.controller,
        onCodeChanged: widget.onChanged,
        onCodeSubmitted: widget.onCompleted,
        decoration: BoxLooseDecoration(
          radius: const Radius.circular(7),
          hintText: List.generate(widget.itemCount, (index) => '-').join(),
          hintTextStyle: sc.body1Theme.copyWith(
            color: AppColors.silver,
            fontSize: 14.0.sp,
          ),
          strokeColorBuilder:
              const FixedColorBuilder(AppColors.mediumShadedBlue),
          bgColorBuilder: PinListenColorBuilder(
            Colors.white,
            AppColors.shadedBlue,
          ),
        ),
      ),
    );
  }
}
