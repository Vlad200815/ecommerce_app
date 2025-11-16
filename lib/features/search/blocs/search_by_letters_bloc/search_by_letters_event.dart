part of 'search_by_letters_bloc.dart';

sealed class SearchByLettersEvent extends Equatable {
  const SearchByLettersEvent();

  @override
  List<Object> get props => [];
}

class OnSearchByLettersEvent extends SearchByLettersEvent {
  final String query;

  const OnSearchByLettersEvent({required this.query});

  @override
  List<Object> get props => [query];
}
