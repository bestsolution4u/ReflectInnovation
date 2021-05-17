import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reflect_innovation/bloc/authentication/bloc.dart';
import 'package:reflect_innovation/config/pref_params.dart';
import 'package:reflect_innovation/util/preference_helper.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthBloc() : super(AuthInitialState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AuthStartEvent) {
      yield* _mapAuthStartEventToState();
    } else if (event is AuthFinishEvent) {
      yield* _mapAuthFinishEventToState(event);
    }
  }

  Stream<AuthenticationState> _mapAuthStartEventToState() async* {
    yield AuthInitialState();
    String userEmail = PreferenceHelper.getString(PrefParams.USER_EMAIL);
    if (userEmail.isNotEmpty) {
      yield AuthSuccessState();
    } else {
      yield AuthFailedState();
    }
  }

  Stream<AuthenticationState> _mapAuthFinishEventToState(AuthFinishEvent event) async* {
    PreferenceHelper.setString(PrefParams.USER_EMAIL, event.email);
    yield AuthSuccessState();
  }
}