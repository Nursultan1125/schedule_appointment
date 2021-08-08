

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/data/repo/base_repo.dart';
import 'package:shcedule_appointmant/data/repo/calender_state.dart';
import 'package:shcedule_appointmant/data/repo/model.dart';
import 'package:shcedule_appointmant/events/calendar_event.dart';

class CalendarBloc extends Bloc <CalendarEvent, CalendarState> {
  final BaseRepository repository;

  CalendarBloc({this.repository}) : super(CalendarState.initialState());

  @override
  get initialState async => CalendarState.initialState();

  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async*{
    if(event is GetApartmentEvent){
      yield CalendarState.fetchData();
      Apartment apartment = await repository.getApartment();
      final state = CalendarState.fetchedData(apartment);
      print(state.apartment.dates);
      print(state.apartment.description);
      yield state;
    }
  }

}