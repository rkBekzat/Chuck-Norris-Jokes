part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class ConnectedState extends InternetState {}

class NotConnectedState extends InternetState{}
