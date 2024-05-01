// Flutter imports:
import 'package:flutter/material.dart';

class TapOutSideUnfocus extends StatelessWidget {
  final Widget child;

  const TapOutSideUnfocus({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child,
      );
}
