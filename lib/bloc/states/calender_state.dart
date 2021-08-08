import 'package:equatable/equatable.dart';
import 'package:shcedule_appointmant/models/apartment.dart';


class CalendarState extends Equatable {
  final Apartment apartment;
  final DateTime selectedDay;
  final bool isLoad;
  final bool isLoadHours;
  final List<String> hours;
  final String selectedHour;

  const CalendarState({
    this.apartment =
        const Apartment(description: "", medialUrls: [], dates: []),
    this.selectedDay,
    this.isLoad = false,
    this.isLoadHours = false,
    this.hours = const [],
    this.selectedHour,
  });

  CalendarState copyWith(
          {apartment, hours, isLoad, isLoadHours, selectedDay, selectedHour}) =>
      CalendarState(
        apartment: apartment ?? this.apartment,
        selectedDay: selectedDay ?? this.selectedDay,
        isLoad: this.isLoad ?? isLoad,
        isLoadHours: this.isLoadHours ?? isLoadHours,
        hours: hours ?? this.hours,
        selectedHour: selectedHour ?? this.selectedHour,
      );


  @override
  List<Object> get props =>
      [isLoad, apartment, isLoadHours, selectedDay, hours, selectedHour];
}
