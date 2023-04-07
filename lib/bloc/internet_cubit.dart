import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _subscription;

  InternetCubit() : super(InternetInitial());

  void connected(){
    emit(ConnectedState());
  }

  void notConnected(){
    emit(NotConnectedState());
  }

  void checkConnection(){
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      if (event == ConnectivityResult.wifi || event == ConnectivityResult.mobile) {
        connected();
      } else {
        notConnected();
      }
    });
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }

}
