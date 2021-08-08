import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shcedule_appointmant/events/calendar_event.dart';

import 'app.dart';
import 'bloc/calendar_bloc.dart';
import 'data/repo/fake_repo.dart';

class AppFactory {
  build() {
    FakeRepo repo = new FakeRepo();
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalendarBloc>(
            create: (context)=>CalendarBloc(repository: repo)..add(GetApartmentEvent()))
      ],
      child: App(),
    );
  }
}
