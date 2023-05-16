part of 'cusine_bloc.dart';

class CusineState {}

class InitialState extends CusineState {}

class LoadingCusines extends CusineState {}

class CusinesLoaded extends CusineState {
  CusinesLoaded({required this.cusines});
  final List<Cusine> cusines;
}

class ErrorLoadingCusines extends CusineState {
  ErrorLoadingCusines({required this.error});
  final String error;
}
