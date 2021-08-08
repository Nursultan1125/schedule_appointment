import 'package:equatable/equatable.dart';

class CalendarEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class GetApartmentEvent extends CalendarEvent {

}

class SelectDayEvent extends CalendarEvent {
  final DateTime selectedDay;

  SelectDayEvent(this.selectedDay);

  @override
  List<Object> get props => [selectedDay];
}

class SelectHourEvent extends CalendarEvent {
  final String selectedHour;

  SelectHourEvent(this.selectedHour);

  @override
  List<Object> get props => [selectedHour];
}

class ClickNextEvent extends CalendarEvent {

}


