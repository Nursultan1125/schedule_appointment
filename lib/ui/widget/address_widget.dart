import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shcedule_appointmant/ui/widget/types.dart';


class AddressWidget extends StatefulWidget {
  final String address;
  final OnChangeText onChangeAddress;

  const AddressWidget({Key key, this.address, this.onChangeAddress})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddressWidget();
  }
}

class _AddressWidget extends State<AddressWidget> {
  TextEditingController addressController = new TextEditingController();

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
                widget.address,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            flex: 8,
          ),
          Expanded(
            child: IconButton(
                onPressed: () => showEditAddress(context),
                icon: Icon(Icons.create_outlined, color: Colors.grey)),
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
                  TextField(controller: addressController),
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
                        if (widget.onChangeAddress != null)
                          widget.onChangeAddress(addressController.text);
                        return Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              )),
            ));
  }
}
