import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourPickerWidget extends StatelessWidget {
  final TimeOfDay time;
  final onChangeTime;

  const HourPickerWidget({Key key, this.time, this.onChangeTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Icon(Icons.watch_later_outlined , color: Colors.grey),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "${formatNumber(time.hour)}:${formatNumber(time.minute)}",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            flex: 8,
          ),
          Expanded(
            child: IconButton(
                onPressed: () => showTimeChange(context),
                icon: Icon(Icons.create_outlined, color: Colors.grey)),
            flex: 1,
          ),
        ],
      ),
    );
  }

  String formatNumber(num) => num <= 9 ? "0${num}" : "${num}";

  void showTimeChange(context) async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if(onChangeTime != null) onChangeTime(newTime);
  }
}
