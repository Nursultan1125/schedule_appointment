import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/bloc/states/calender_state.dart';
import 'package:shcedule_appointmant/data/repo/base_repo.dart';
import 'package:shcedule_appointmant/models/apartment.dart';

import 'events/calendar_event.dart';
import 'events/order_page_event.dart';
import 'order_page_bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final BaseRepository repository;
  final OrderPageBloc orderPageBloc;

  CalendarBloc({
    this.repository,
    this.orderPageBloc,
  }) : super(CalendarState());

  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
    if (event is GetApartmentEvent) {
      yield state.copyWith(isLoad: true);
      Apartment apartment = await repository.getApartment();
      yield state.copyWith(apartment: apartment);
    }
    if (event is SelectDayEvent) {
      yield state.copyWith(isLoadHours: true, selectedDay: event.selectedDay);
      List<String> hours = await repository.getHoursByDay(event.selectedDay);
      yield state.copyWith(isLoadHours: false, hours: hours, selectedDay: event.selectedDay);
    }
    if (event is SelectHourEvent)
      yield state.copyWith(selectedHour: event.selectedHour);
    if (event is ClickNextEvent) {
      TimeOfDay timeOfDay = TimeOfDay(
        hour: int.parse(state.selectedHour.split(":")[0]),
        minute: int.parse(state.selectedHour.split(":")[1]),
      );
      orderPageBloc.add(GoToOrderPageEvent(
        date: state.selectedDay,
        time: timeOfDay,
        description: state.apartment.description,
        address: state.apartment.address,
        imageUrls: state.apartment.medialUrls.map<String>((MediaUrl media) => media.url).toList(),
      ));
    }
  }
}
