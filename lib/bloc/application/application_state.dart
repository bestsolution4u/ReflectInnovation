import 'package:meta/meta.dart';

@immutable
abstract class ApplicationState {}

class ApplicationLoadingState extends ApplicationState {}

class ApplicationStartedState extends ApplicationState {}