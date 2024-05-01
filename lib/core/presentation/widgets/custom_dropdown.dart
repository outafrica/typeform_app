// Flutter imports:
// ignore_for_file: deprecated_member_use

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:typeform_app/core/platform/size_config.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T?> onChanged;
  final T value;
  final bool isEnabled;
  final String hint;
  const CustomDropdown({
    Key? key,
    required this.dropdownMenuItemList,
    required this.onChanged,
    required this.value,
    required this.hint,
    this.isEnabled = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig(context: context);
    return IgnorePointer(
      ignoring: !isEnabled,
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            // border:
            color: isEnabled ? Colors.grey[50] : Colors.grey.withAlpha(100)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text(
              hint,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: sc.heightScaledSize(16)),
            ),
            isExpanded: true,
            itemHeight: 50.0,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: sc.heightScaledSize(16),
                ),
            // TextStyle(
            //     fontSize: 15.0,
            //     color: isEnabled ? Colors.black : Colors.grey[700]),
            items: dropdownMenuItemList,
            onChanged: onChanged,
            value: value,
          ),
        ),
      ),
    );
  }
}
