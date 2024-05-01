// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class AppDropDownWithBorders extends StatefulWidget {
  //We do not need to return the widget, at least exposing the actual value enables flexibility,
  // Given that, the list of values where passed from the parent
  final ValueChanged<int>? onItemSelected;
  final List<Widget>? menuItems;
  final bool hasRadius;
  final bool enabled;
  final bool maxWidth;
  final bool hasTopBorder;
  final bool hasBorders;
  final bool hasBottomBorder;
  final bool hasTitle;
  final bool hasTitleIcon;
  final Widget? titleIcon;
  final TextStyle? titleStyle;
  final String? title;
  final Color? color;
  final double height;
  final double width;
  final String? hint;
  final int? initialSelectedIndex;
  final EdgeInsetsGeometry padding;
  final bool enableWidth;

  const AppDropDownWithBorders({
    this.onItemSelected,
    this.menuItems,
    this.hasTopBorder = false,
    this.hasBottomBorder = false,
    this.initialSelectedIndex = 0,
    this.enabled = false,
    this.hasRadius = false,
    this.width = double.maxFinite,
    this.maxWidth = false,
    this.enableWidth = true,
    this.padding = const EdgeInsets.only(top: 2.0, left: 16, right: 10),
    this.color,
    this.height = 60,
    this.hint,
    this.hasBorders = true,
    this.hasTitle = false,
    this.hasTitleIcon = false,
    this.titleStyle,
    this.title,
    this.titleIcon,
  });

  @override
  _AppDropDownWithBordersState createState() => _AppDropDownWithBordersState();
}

class _AppDropDownWithBordersState extends State<AppDropDownWithBorders> {
  int? selectedID;

  @override
  Widget build(BuildContext context) {
    const _border = BorderSide(
      color: Colors.black12,
      width: 1.0,
    );

    final _sc = SizeConfig(context: context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            widget.hasTitleIcon ? widget.titleIcon! : Container(),
            widget.hasTitle
                ? Text(widget.title!, style: widget.titleStyle)
                : Container(),
          ],
        ),
        widget.hasTitle
            ? SizedBox(
                height: 1.0.h,
              )
            : Container(),
        Container(
          height: _sc.heightScaledSize(widget.height),
          width: widget.width,
          // width: !widget.enableWidth ? null : widget.width ?? _sc.screenWidth * 0.76,
          padding: widget.padding,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: const Icon(Icons.keyboard_arrow_down),
              value: selectedID ?? widget.initialSelectedIndex,
              hint: AutoSizeText("${widget.hint}"),
              isExpanded: widget.maxWidth,
              onChanged: (int? index) {
                setState(() {
                  selectedID = index;
                });

                widget.onItemSelected!(index!);
              },
              items: widget.menuItems
                  ?.map((item) => DropdownMenuItem(
                        child: item,
                        value: widget.menuItems!.indexOf(item),
                      ))
                  .toList(),
            ),
          ),
          decoration: !widget.hasRadius
              ? BoxDecoration(
                  border: widget.hasBorders
                      ? Border.all(
                          color: AppColors.mediumShadedBlue,
                        )
                      : Border(
                          bottom: widget.hasBottomBorder
                              ? _border
                              : const BorderSide(color: Colors.transparent),
                          top: widget.hasTopBorder
                              ? _border
                              : const BorderSide(color: Colors.transparent)),
                  color: widget.color ?? AppColors.shadedBlue,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                )
              : BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: widget.color ?? AppColors.shadedBlue,
                ),
        ),
      ],
    );
  }
}
