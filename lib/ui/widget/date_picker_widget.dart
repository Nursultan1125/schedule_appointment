import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

typedef OnChangeDate = void Function(DateTime date);

class DatePickerWidget extends StatelessWidget {
  final DateTime date;
  final OnChangeDate onChangeDate;

  const DatePickerWidget({Key key, this.date, this.onChangeDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Icon(Icons.calendar_today_outlined, color: Colors.grey),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "${DateFormat.yMMMMd("ru_RU").format(date)}",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            flex: 8,
          ),
          Expanded(
            child: IconButton(
                onPressed: () => showDateSelect(context),
                icon: Icon(Icons.create_outlined, color: Colors.grey)),
            flex: 1,
          ),
        ],
      ),
    );
  }

  void showDateSelect(context) async{
    DateTime date = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(1990, 1, 1),
      lastDate: DateTime.utc(2030, 1, 1),
      context: context,
    );
    print(date);
    if(onChangeDate != null) onChangeDate(date);
  }
}
