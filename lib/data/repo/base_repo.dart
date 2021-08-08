
import 'dart:io';

import 'package:flutter/src/material/time.dart';
import 'package:shcedule_appointmant/models/apartment.dart';

abstract class BaseRepository {
  Future<BaseModel> getApartment();

  Future<List<String>> getHoursByDay(DateTime selectedDay);

  Future<bool> sendOrder({String description, String address, DateTime date, TimeOfDay time});

  Future<bool> uploadImage(File img);
}