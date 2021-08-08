import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OrderPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoToOrderPageEvent extends OrderPageEvent {
  final DateTime date;
  final TimeOfDay time;
  final String description;
  final String address;
  final List<String> imageUrls;

  GoToOrderPageEvent({
    this.date,
    this.time,
    this.description = "",
    this.address = "",
    this.imageUrls = const [],
  });
}

class OnChangeDescriptionEvent extends OrderPageEvent {
  final String description;

  OnChangeDescriptionEvent(this.description);
}

class OnChangeAddressEvent extends OrderPageEvent {
  final String address;

  OnChangeAddressEvent(this.address);
}

class OnChangeDateEvent extends OrderPageEvent {
  final DateTime date;

  OnChangeDateEvent(this.date);
}

class OnChangeTimeEvent extends OrderPageEvent {
  final TimeOfDay time;

  OnChangeTimeEvent(this.time);
}

class SendOrderEvent extends OrderPageEvent {

}

class UploadImageEvent extends OrderPageEvent{
  final File img;

  UploadImageEvent(this.img);
}
