// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class AcceptTermsWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const AcceptTermsWidget({super.key, required this.onChanged});

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  bool acceptPrivacy = false;
  late TapGestureRecognizer termsCondition;
  late TapGestureRecognizer privacy;

  @override
  void initState() {
    super.initState();
    termsCondition = TapGestureRecognizer()
      ..onTap = () {
        openPolicy("term");
      };
    privacy = TapGestureRecognizer()
      ..onTap = () {
        openPolicy("privacy");
      };
  }

  openPolicy(String type) => context.push(
        '/webview?url=${type == 'privacy' ? AppStrings.privacyPolicyUrl : AppStrings.termsConditionUrl}&title=${type == 'privacy' ? 'Privacy Policy' : 'Terms and Conditions'}',
      );

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    final linkStyle = _sc.body1Theme.copyWith(
      color: AppColors.primaryRed,
      fontWeight: FontWeight.w600,
      fontSize: 10.0.sp,
      // height: 1.6,
    );

    final textStyle = _sc.body1Theme.copyWith(
      fontSize: 10.0.sp,
      color: AppColors.primaryBlue,
      fontWeight: FontWeight.w400,
      // height: 1.6,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Container(
              width: _sc.heightScaledSize(36),
              height: _sc.heightScaledSize(36),
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                checkColor: Colors.white,
                activeColor: AppColors.primaryRed,
                fillColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColors.primaryRed;
                    }

                    return Colors.white;
                  },
                ),
                value: acceptPrivacy,
                onChanged: (bool? value) {
                  setState(() {
                    acceptPrivacy = value!;
                    widget.onChanged(acceptPrivacy);
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 2.5.w),
        Flexible(
          child: GestureDetector(
            onTap: () {
              setState(() {
                acceptPrivacy = !acceptPrivacy;
                widget.onChanged(acceptPrivacy);
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.84,
              child: AutoSizeText.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "I agree to Remit's ", style: textStyle),
                    TextSpan(
                        recognizer: termsCondition,
                        text: "Terms & conditions ",
                        style: linkStyle),
                    TextSpan(text: "and ", style: textStyle),
                    TextSpan(
                        recognizer: privacy,
                        text: 'privacy policy',
                        style: linkStyle),
                  ],
                ),
                maxLines: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
