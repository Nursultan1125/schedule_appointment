import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar/utils.dart';

class Calendar extends StatefulWidget {
  DateTime selectedDay;
  OnDaySelected? onSelected;
  Set<DateTime>? enabledDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  Calendar({
    required this.selectedDay,
    this.enabledDays,
    this.onSelected,
  });

  @override
  State<StatefulWidget> createState() {
    return new _Calendar();
  }
}

class _Calendar extends State<Calendar> {
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFDFE0E5)),
        ),
        height: this.height * 0.46,
        margin: EdgeInsets.only(right: 8, left: 8),
        child: TableCalendar(
          locale: "ru_RU",
          daysOfWeekHeight: 30,
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            leftChevronMargin: EdgeInsets.all(1),
            rightChevronMargin: EdgeInsets.all(1),
            leftChevronPadding: EdgeInsets.zero,
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
              dowTextFormatter: (date, locale) {
                final weekFormat = DateFormat.E(locale).format(date);
                return "${weekFormat[0].toUpperCase()}${weekFormat[1]}";
              },
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFD8D9DE))),
                shape: BoxShape.rectangle,
              ),
              weekdayStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xff8f95b3),
              ),
              weekendStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xff8f95b3),
              )),
          shouldFillViewport: true,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            todayDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: Color(0xFF744CD0)),
              color: Color(0xFFF3F1FA),
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Color(0xFF744CD0)),
              color: Color(0xFFF3F1FA),
            ),
            cellMargin: EdgeInsets.all(1),
            defaultTextStyle: TextStyle(color: Colors.black, fontSize: 12),
            selectedTextStyle: TextStyle(color: Colors.black, fontSize: 12),
            todayTextStyle: TextStyle(color: Colors.black, fontSize: 12),
          ),
          availableCalendarFormats: const {
            CalendarFormat.month: "",
          },
          calendarBuilders: CalendarBuilders(
              // disabledBuilder: (BuildContext context, DateTime day, DateTime focusedDay){
              //   final text = '${day.day}';
              //   return Text(text);
              // }
          ),
          // logic
          firstDay: DateTime.utc(1990, 1, 1),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: widget.selectedDay,
          calendarFormat: CalendarFormat.month,
          currentDay: DateTime.now(),
          // selectedDayPredicate: (day) {
          //   // Use values from Set to mark multiple days as selected
          //   return _selectedDays.contains(day);
          // },
          // eventLoader: (day) => [5],
          onDaySelected: (DateTime selectDay, DateTime focusedDay) {
            setState(() {
              widget.selectedDay = selectDay;
              if (_selectedDays.contains(selectDay)) {
                _selectedDays.remove(selectDay);
              } else {
                _selectedDays.add(selectDay);
              }
            });
            if(widget.onSelected != null) widget.onSelected!(selectDay, focusedDay);
          },
          selectedDayPredicate: (DateTime day) {
            return isSameDay(widget.selectedDay, day);
          },
          enabledDayPredicate: (day) {
            return (widget.enabledDays ?? LinkedHashSet()).contains(day);
          },
        ));
  }

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;
}
