import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  late final StreamSubscription _subscription;

  InternetCubit() : super(InternetInitial()) {
    _subscription =
        Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile ||
          event == ConnectivityResult.ethernet) {
        connected();
      } else {
        notConnected();
      }
    });
  }

  void connected() {
    emit(ConnectedState());
  }

  void notConnected() {
    emit(NotConnectedState());
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
