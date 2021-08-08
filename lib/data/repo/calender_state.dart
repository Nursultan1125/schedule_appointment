

import 'package:equatable/equatable.dart';

import 'model.dart';

class CalendarState extends Equatable {
  final Apartment apartment;
  final bool isLoad;
  const CalendarState._({
    this.apartment= const Apartment(description: "", medialUrls: [], dates: []),
    this.isLoad=false,
  });
  const CalendarState.fetchData(): this._(isLoad: true);
  const CalendarState.fetchedData(Apartment apartment): this._(apartment: apartment, isLoad: false);

  const CalendarState.initialState(): this._();
  @override
  List<Object> get props => [isLoad, apartment];
}