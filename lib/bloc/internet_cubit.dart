import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late final StreamSubscription _subscription;

  InternetCubit() : super(InternetInitial()){
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      if (event == ConnectivityResult.wifi || event == ConnectivityResult.mobile || event == ConnectivityResult.ethernet) {
        connected();
      } else {
        notConnected();
      }
    });
  }

  void connected(){
    emit(ConnectedState());
  }

  void notConnected(){
    emit(NotConnectedState());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

}
