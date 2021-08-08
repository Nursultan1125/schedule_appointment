
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OrderPageState extends Equatable{
  final bool isUploading;
  final DateTime date;
  final TimeOfDay time;
  final String description;
  final String address;
  final List<String> imageUrls;

  OrderPageState({
    this.date,
    this.time,
    this.description,
    this.address,
    this.imageUrls,
    this.isUploading,
  });

  OrderPageState copyWith({date, time, description, address, imageUrls, isUploading}) => OrderPageState(
      date: date??this.date,
      time: time??this.time,
      description: description??this.description,
      address: address??this.address,
      imageUrls: imageUrls??this.imageUrls,
      isUploading: isUploading??this.isUploading,
  );

  @override
  List<Object> get props => [date, time, description, address, isUploading, imageUrls];

}