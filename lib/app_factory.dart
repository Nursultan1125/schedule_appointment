import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'bloc/calendar_bloc.dart';
import 'bloc/events/calendar_event.dart';
import 'bloc/order_page_bloc.dart';
import 'data/repo/fake_repo.dart';

class AppFactory {
  build() {
    FakeRepo repo = new FakeRepo();
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrderPageBloc>(
          create: (context) => OrderPageBloc(repository: repo),
        ),
        BlocProvider<CalendarBloc>(
            create: (context) => CalendarBloc(
                repository: repo,
                orderPageBloc: BlocProvider.of<OrderPageBloc>(context))
              ..add(GetApartmentEvent()))
      ],
      child: App(),
    );
  }
}
