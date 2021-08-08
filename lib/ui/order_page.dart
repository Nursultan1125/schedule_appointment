import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shcedule_appointmant/ui/widget/address_widget.dart';
import 'package:shcedule_appointmant/ui/widget/date_picker_widget.dart';
import 'package:shcedule_appointmant/ui/widget/description_widget.dart';
import 'package:shcedule_appointmant/ui/widget/hour_picker_widget.dart';
import 'package:shcedule_appointmant/ui/widget/slider.dart';

import '../env.dart';
import 'order_success_page.dart';

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderPage();
  }
}

class _OrderPage extends State<OrderPage> {
  List<String> images = [
    "https://i.pinimg.com/564x/23/d8/0c/23d80c73cc2e4500d00254e3e3e7d6d4.jpg",
    "https://i.pinimg.com/564x/28/98/f2/2898f273c4272244e06fa4ab6fc3cb9d.jpg",
    "https://q-xx.bstatic.com/xdata/images/hotel/max500/150571840.jpg?k=0757ca2e8ecc7d2eac3f6dc8f6f141acdb729530d7dfeca8437f4581758a7bfd&o=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          brightness: Brightness.light,
          // status bar brightness
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Обзор вашего заказа",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            child: ListView(
          children: [
            SliderWidget(
              imagesUrls: images,
              onUploadFile: (file) => print(file),
            ),
            Divider(),
            DescriptionWidget(
              onChange: (text) => print(text),
            ),
            Divider(),
            AddressWidget(
              address: "ул. Шабдан-Баатыр 2/26 кв 12 г. Бишкек",
              onChangeAddress: (address) => print(address),
            ),
            Divider(),
            DatePickerWidget(
              date: DateTime.now(),
            ),
            Divider(),
            HourPickerWidget(
              time: TimeOfDay.now(),
            ),
            Container(
              margin: EdgeInsets.only(right: 8, left: 8),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF744CD0))),
                child: Text(
                  "Вызвать мастера",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => OrderSuccessPage());
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 8, left: 8),
              child: TextButton(
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(width: 1, color: Colors.grey)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                child: Text(
                  "Отмна",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        )));
  }
}
