import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.zero,
          child: PreferredSize(
              preferredSize: Size.zero,
              child: AppBar(
                brightness: Brightness.light, // status bar brightness
                elevation: 0,
                toolbarHeight: 0,
              ))),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              width: 90,
              height: 90,
              child: Image.asset("assets/success.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Ваш заказ принят.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              width: 150,
              child: Text(
                "В ближайшее время с вами свяжется мастер",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
