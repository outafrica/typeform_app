// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:typeform_app/core/platform/app_colors.dart';
import 'package:typeform_app/core/platform/size_config.dart';
import 'package:sizer/sizer.dart';

class InfoPanel extends StatelessWidget {
  final InfoType infoType;
  final TextSpan mainText;
  final TextSpan? subText;

  const InfoPanel({
    super.key,
    required this.infoType,
    required this.mainText,
    this.subText,
  });

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);
    const spacing = 15.0;

    return Container(
      decoration: BoxDecoration(
        color: infoType == InfoType.info
            ? AppColors.infoBG
            : infoType == InfoType.warning
                ? AppColors.warningBG
                : infoType == InfoType.error
                    ? AppColors.error.withOpacity(0.8)
                    : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(_sc.heightScaledSize(15)!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (infoType == InfoType.info)
            Icon(
              Icons.info,
              size: 20.0.sp,
            ),
          SizedBox(height: _sc.heightScaledSize(spacing)),
          Text.rich(
            mainText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          if (subText != null) ...[
            SizedBox(height: _sc.heightScaledSize(spacing)),
            Text.rich(
              subText!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
          SizedBox(height: _sc.heightScaledSize(spacing * 2)),
        ],
      ),
    );
  }
}

enum InfoType { info, warning, error }
