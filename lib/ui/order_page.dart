import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/bloc/events/order_page_event.dart';
import 'package:shcedule_appointmant/bloc/order_page_bloc.dart';
import 'package:shcedule_appointmant/bloc/states/order_page_state.dart';
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
        body: BlocBuilder<OrderPageBloc, OrderPageState>(
            builder: (context, state) => Container(
                    child: ListView(

                  children: [
                    SliderWidget(
                      imagesUrls: state.imageUrls,
                      onUploadFile: (file) => context.read<OrderPageBloc>().add(UploadImageEvent(file)),
                    ),
                    Divider(),
                    DescriptionWidget(
                      text: state.description,
                      onChange: (text) => context.read<OrderPageBloc>().add(OnChangeDescriptionEvent(text)),
                    ),
                    Divider(),
                    AddressWidget(
                      address: state.address,
                      onChangeAddress: (address) => context.read<OrderPageBloc>().add(OnChangeAddressEvent(address)),
                    ),
                    Divider(),
                    DatePickerWidget(
                      date: state.date,
                      onChangeDate: (date) => context.read<OrderPageBloc>().add(OnChangeDateEvent(date)),
                    ),
                    Divider(),
                    HourPickerWidget(
                      time: state.time,
                      onChangeTime: (time) => context.read<OrderPageBloc>().add(OnChangeTimeEvent(time)),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8, left: 8),
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF744CD0))),
                        child: Text(
                          "Вызвать мастера",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        onPressed: () {
                          context.read<OrderPageBloc>().add(SendOrderEvent());
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
                ))));
  }
}
