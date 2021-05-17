import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reflect_innovation/bloc/bloc.dart';

class AppBloc {
  static final applicationBloc = ApplicationBloc();
  static final authBloc = AuthBloc();
  static final bleBloc = BleBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(create: (context) => applicationBloc),
    BlocProvider<AuthBloc>(create: (context) => authBloc),
    BlocProvider<BleBloc>(create: (context) => bleBloc),
  ];

  static void dispose() {
    applicationBloc.close();
    authBloc.close();
    bleBloc.close();
  }

  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
