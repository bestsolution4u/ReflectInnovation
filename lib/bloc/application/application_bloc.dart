import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reflect_innovation/bloc/app_bloc.dart';
import 'package:reflect_innovation/bloc/bloc.dart';
import 'package:reflect_innovation/config/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationLoadingState());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartEvent) {
      yield* _mapApplicationStartEventToState();
    }
  }

  Stream<ApplicationState> _mapApplicationStartEventToState() async* {
    yield ApplicationLoadingState();

    Globals.preferences = await SharedPreferences.getInstance();

    AppBloc.authBloc.add(AuthStartEvent());

    yield ApplicationStartedState();
  }
}