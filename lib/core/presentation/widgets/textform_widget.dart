// Flutter imports:
import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final TextFormField textFormField;
  const TextFormWidget({
    Key? key,
    required this.textFormField,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          // border:
          color: Colors.grey[50],
        ),
        child: textFormField,
      );
}
