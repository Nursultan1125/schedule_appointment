import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/bloc/calendar_bloc.dart';
import 'package:shcedule_appointmant/data/repo/calender_state.dart';
import 'package:shcedule_appointmant/ui/widget/hours_widget.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/utils.dart';

import '../env.dart';

class CalendarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _CalendarPage();
  }
}

class _CalendarPage extends State<CalendarPage> {
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.zero,
            child: AppBar(
              brightness: Brightness.light, // status bar brightness
              elevation: 0,
              toolbarHeight: 0,
            )),
        body: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) => Center(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xFFD8D9DE)))),
                    child: SizedBox(
                      height: height * 0.16,
                      child: Center(
                        child: Text(
                          "${DateFormat.yMMMMd("ru_RU").format(selectedDay)} 14:00",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Calendar(
                    selectedDay: selectedDay,
                    enabledDays: LinkedHashSet<DateTime>(
                      equals: isSameDay,
                      hashCode: getHashCode,
                    )..addAll(state.apartment.dates?.toSet()),
                  ),
                  HoursWidget(
                    hours: [],
                    onChange: (str) => print(str),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 8, left: 8),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF744CD0))),
                      child: Text(
                        "Далее",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(OrderRoute.orderPage),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  double get width => MediaQuery.of(context).size.width;

  double get height => MediaQuery.of(context).size.height;
}
