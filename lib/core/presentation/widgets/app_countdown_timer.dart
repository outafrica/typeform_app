// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class Time {
  final int minutes;
  final int seconds;

  const Time({this.minutes = 2, this.seconds = 0});
}

class AppCountdownTimer extends StatefulWidget {
  // final String label;
  final Time time;
  final VoidCallback? onComplete;
  final bool start;

  const AppCountdownTimer({
    super.key,
    // required this.label,
    this.time = const Time(),
    this.onComplete,
    this.start = false,
  });

  @override
  State<AppCountdownTimer> createState() => _AppCountdownTimerState();
}

class _AppCountdownTimerState extends State<AppCountdownTimer> {
  int m = 0;
  int s = 0;

  Stream<Time> countdown() => Stream<Time>.periodic(
        const Duration(seconds: 1),
        (i) {
          // Decrement seconds
          if (s > 0) s--;
          // If seconds reaches 0, decrement the minute.
          if (s == 0 && m > 0) {
            m--;
            // Reset seconds to 59
            s = 59;
          }

          if (m == 0 && s == 0 && widget.onComplete != null) {
            s = widget.time.seconds;
            m = widget.time.minutes;
            widget.onComplete!();
          }

          return Time(minutes: m, seconds: s);
        },
      );

  @override
  void initState() {
    m = widget.time.minutes;
    s = widget.time.seconds;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<Time>(
        initialData: widget.time,
        stream: widget.start ? countdown() : null,
        builder: (context, snapshot) => Text.rich(
          TextSpan(
            text: 'Didn\'t receive the code? ',
            children: [
              TextSpan(
                text:
                    'Resend code (${snapshot.data?.minutes}:${snapshot.data!.seconds < 10 ? '0' : ''}${snapshot.data?.seconds})',
                style: AppStyles.textStyleBody(context).copyWith(
                  color: AppColors.orange,
                ),
              ),
            ],
            style: AppStyles.textStyleBody(context),
          ),
          // style: ,
        ),
      );
}
