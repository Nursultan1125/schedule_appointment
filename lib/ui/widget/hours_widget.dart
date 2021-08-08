import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


typedef FunctionOnChange = void Function(String);

class HoursWidget extends StatefulWidget {
  final List<String> hours;
  final FunctionOnChange onChange;

  const HoursWidget({Key key, this.hours, this.onChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HoursWidget();
  }
}

class _HoursWidget extends State<HoursWidget> {
  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: GridView.count(
        childAspectRatio: 2,
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: buildHoursButtons(),
      ),
    );
  }

  List<Widget> buildHoursButtons() =>
      widget.hours.map((hour) => buildHourButton(hour: hour)).toList();

  Widget buildHourButton({String hour, onPress}) => Container(
        height: 10,
        margin: EdgeInsets.all(2.0),
        child: new TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                this.value == hour ? Color(0xFF744CD0) : Color(0xF6F7FBFF)),
          ),
          onPressed: () {
            setState(() {
              this.value = hour;
            });
            if(widget.onChange != null) widget.onChange(value);
          },
          child: Text(
            hour,
            style: TextStyle(
              color: this.value == hour ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      );

  double get height => MediaQuery.of(context).size.height;
  
}
