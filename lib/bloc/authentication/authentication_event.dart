import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthStartEvent extends AuthenticationEvent {}

class AuthFinishEvent extends AuthenticationEvent {
  final String email;

  AuthFinishEvent({this.email});
}