import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/bloc/calendar_bloc.dart';
import 'package:shcedule_appointmant/bloc/events/calendar_event.dart';
import 'package:shcedule_appointmant/bloc/states/calender_state.dart';
import 'package:shcedule_appointmant/ui/widget/hours_widget.dart';
import 'package:shcedule_appointmant/ui/widget/primary_button.dart';
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
                          "${DateFormat.yMMMMd("ru_RU").format(state.selectedDay ?? DateTime.now())} 14:00",
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
                    selectedDay: state.selectedDay ?? DateTime.now(),
                    enabledDays: LinkedHashSet<DateTime>(
                      equals: isSameDay,
                      hashCode: getHashCode,
                    )..addAll(state.apartment.dates?.toSet()),
                    onSelected: (DateTime day, DateTime focused) =>
                        context.read<CalendarBloc>().add(SelectDayEvent(day)),
                  ),
                  HoursWidget(
                    hours: state.hours,
                    onChange: (hour) => context.read<CalendarBloc>().add(SelectHourEvent(hour)),
                  ),
                  PrimaryButton(
                    text: "Далее",
                    onPressed: (){
                      context.read<CalendarBloc>().add(ClickNextEvent());
                      Navigator.of(context).pushNamed(OrderRoute.orderPage);
                    },
                    disabled: state.selectedHour == null,
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
