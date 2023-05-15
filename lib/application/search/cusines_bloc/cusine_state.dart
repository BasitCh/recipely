part of 'cusine_bloc.dart';

class CusineState {}

class InitialState extends CusineState {}

class LoadingCusines extends CusineState {}

class CusinesLoaded extends CusineState {
  final List<Cusine> cusines;
  CusinesLoaded({required this.cusines});
}

class ErrorLoadingCusines extends CusineState {
  final String error;
  ErrorLoadingCusines({required this.error});
}
