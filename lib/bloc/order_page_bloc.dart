

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/bloc/states/order_page_state.dart';
import 'package:shcedule_appointmant/data/repo/base_repo.dart';

import 'events/order_page_event.dart';

class OrderPageBloc extends Bloc<OrderPageEvent, OrderPageState>{
  final BaseRepository repository;
  OrderPageBloc({this.repository}) : super(OrderPageState());

  @override
  Stream<OrderPageState> mapEventToState(OrderPageEvent event) async*{
    if(event is GoToOrderPageEvent){
      yield state.copyWith(
          date: event.date,
          time: event.time,
          description: event.description,
          address: event.address,
          imageUrls: event.imageUrls,
      );
    }
    if(event is OnChangeAddressEvent)
      yield state.copyWith(address: event.address);
    if(event is OnChangeDescriptionEvent)
      yield state.copyWith(description: event.description);
    if(event is OnChangeDateEvent)
      yield state.copyWith(date: event.date);
    if(event is OnChangeTimeEvent)
      yield state.copyWith(time: event.time);
    if(event is SendOrderEvent) {
      yield state.copyWith(isUploading: true);
      await repository.sendOrder(
        description: state.description,
        address: state.address,
        date: state.date,
        time: state.time,
      );
      yield state.copyWith(isUploading: false);
    }
    if(event is UploadImageEvent){
      yield state.copyWith(isUploading: true);
      await repository.uploadImage(event.img);
      yield state.copyWith(isUploading: false);

    }
  }

}