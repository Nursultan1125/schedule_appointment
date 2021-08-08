import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/app_factory.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shcedule_appointmant/simple_blog_delegate.dart';

void main() {
  initializeDateFormatting("ru_RU", null);
  Bloc.observer = SimpleBlocDelegate();
  final app = AppFactory();
  runApp(app.build());
}