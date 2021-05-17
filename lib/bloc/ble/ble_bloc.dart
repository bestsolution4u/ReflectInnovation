import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reflect_innovation/bloc/ble/ble_event.dart';
import 'package:reflect_innovation/bloc/ble/ble_state.dart';

class BleBloc extends Bloc<BleEvent, BleState> {
  BleBloc() : super(BleInitialState());

  @override
  Stream<BleState> mapEventToState(BleEvent event) async* {

  }

}