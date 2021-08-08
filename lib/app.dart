
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shcedule_appointmant/env.dart';
import 'package:shcedule_appointmant/ui/calendar_page.dart';
import 'package:shcedule_appointmant/ui/order_page.dart';
import 'env.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: "Schedule appointment",
      debugShowCheckedModeBanner: Env.debug,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.orange,
        textTheme: TextTheme(
          button: TextStyle(
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      home: CalendarPage(),
      routes: {
        OrderRoute.orderPage: (context) => OrderPage()
      },
    );
  }

}