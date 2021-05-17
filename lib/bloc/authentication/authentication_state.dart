import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState {}

class AuthInitialState extends AuthenticationState {}

class AuthSuccessState extends AuthenticationState {}

class AuthFailedState extends AuthenticationState {}