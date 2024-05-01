// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:typeform_app/core/platform/platform.dart';

class CalendarWidget extends StatefulWidget {
  final ValueChanged<DateTime> selectedDay;

  const CalendarWidget({
    super.key,
    required this.selectedDay,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selected;

  late DateTime initialDate;

  @override
  void initState() {
    super.initState();
    initialDate = DateTime(
      DateTime.now().year - 18,
      DateTime.now().month,
      DateTime.now().day,
    );

    _selected = initialDate;
  }

  @override
  Widget build(BuildContext context) {
    final _sc = SizeConfig(context: context);

    final config = CalendarDatePicker2Config(
      selectedDayHighlightColor: Colors.black,
      weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
      weekdayLabelTextStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 0,
      controlsHeight: _sc.heightScaledSize(50),
      controlsTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      firstDate: DateTime(1800),
      lastDate: initialDate,
      selectedDayTextStyle: _sc.body1Theme.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CalendarDatePicker2(
        config: config,
        value: [_selected],
        onValueChanged: (values) {
          setState(() => _selected = values.first!);
          widget.selectedDay(_selected);
        },
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    //   child: TableCalendar(
    //     headerVisible: true,
    //     focusedDay: _selected,
    //     firstDay: DateTime(1900),
    //     lastDay: initialDate,
    //     onDaySelected: (day, _) {
    //       setState(() {
    //         _selected = day;
    //       });
    //       widget.selectedDay(_selected);
    //     },
    //     headerStyle: HeaderStyle(
    //       titleCentered: true,
    //       headerMargin: EdgeInsets.symmetric(vertical: 2.0.h),
    //       rightChevronIcon: const Icon(
    //         Icons.chevron_right,
    //         color: AppColors.silver,
    //       ),
    //       leftChevronIcon: const Icon(
    //         Icons.chevron_left,
    //         color: AppColors.silver,
    //       ),
    //       // titleTextStyle: _sc.body1Theme.copyWith(
    //       //   color: Colors.white,
    //       //   fontWeight: FontWeight.w400,
    //       // ),
    //       leftChevronPadding: EdgeInsets.zero,
    //       rightChevronPadding: EdgeInsets.zero,
    //     ),
    //     selectedDayPredicate: (DateTime date) =>
    //         date.month == _selected.month &&
    //         date.year == _selected.year &&
    //         date.day == _selected.day,
    //     availableCalendarFormats: const {
    //       CalendarFormat.month: "Month",
    //     },
    //     calendarFormat: CalendarFormat.month,
    //     calendarStyle: CalendarStyle(
    //       cellPadding: EdgeInsets.zero,
    //       isTodayHighlighted: false,
    //       defaultTextStyle: _sc.body1Theme.copyWith(
    //         color: Colors.black,
    //         fontWeight: FontWeight.w400,
    //       ),
    //       selectedDecoration: BoxDecoration(
    //         color: Colors.black,
    //         // borderRadius: BorderRadius.circular(8),
    //         borderRadius: BorderRadius.all(Radius.circular(8)),
    //       ),
    //       selectedTextStyle: _sc.body1Theme.copyWith(
    //         color: Colors.white,
    //         fontWeight: FontWeight.w400,
    //       ),
    //     ),
    //   ),
    // );
  }
}
