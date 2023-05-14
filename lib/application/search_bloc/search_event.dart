part of 'search_bloc.dart';

class SearchEvent {}

class GetFood extends SearchEvent {}

class SearchTextChanged extends SearchEvent {
  final String query;

  SearchTextChanged({required this.query});
}
