

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shcedule_appointmant/ui/widget/types.dart';


class DescriptionWidget extends StatefulWidget{
  final String text;
  final OnChangeText onChange;

  const DescriptionWidget({Key key, this.text, this.onChange}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DescriptionWidget();
  }

}

class _DescriptionWidget extends State<DescriptionWidget>{

  bool get isEmptyText => widget.text == null ||  widget.text.isEmpty;
  TextEditingController textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    String placeHolderText = "Добавить кратакое опсание";
    return Container(
      margin: EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Icon(Icons.create_outlined , color: Colors.grey),
            flex: 1,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                isEmptyText ? placeHolderText : widget.text,
                style: TextStyle(
                  fontSize: 14,
                  color: isEmptyText ? Colors.grey : Colors.black,
                ),
              ),
            ),
            flex: 8,
          ),
          Expanded(
            child: IconButton(
                onPressed: () => showEditAddress(context),
                icon: Icon(Icons.chevron_right, color: Colors.grey)),
            flex: 1,
          ),
        ],
      ),
    );
  }

  void showEditAddress(context) async {
    await showDialog(
        context: context,
        builder: (context) => Scaffold(
          body: Container(
              child: Column(
                children: [
                  TextField(controller: textController),
                  Container(
                    margin: EdgeInsets.only(right: 8, left: 8),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF744CD0))),
                      child: Text(
                        "Сохранить",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (widget.onChange != null)
                          widget.onChange(textController.text);
                        return Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              )),
        ));
  }

}