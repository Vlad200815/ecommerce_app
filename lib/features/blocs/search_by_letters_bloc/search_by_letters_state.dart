part of 'search_by_letters_bloc.dart';

sealed class SearchByLettersState extends Equatable {
  const SearchByLettersState();

  @override
  List<Object> get props => [];
}

final class SearchByLettersInitial extends SearchByLettersState {}

final class SearchByLettersProgress extends SearchByLettersState {}

final class SearchByLettersFailure extends SearchByLettersState {
  final Object error;

  const SearchByLettersFailure({required this.error});

  @override
  List<Object> get props => [error];
}

final class SearchByLettersSuccess extends SearchByLettersState {
  final List<ProductModel> products;

  const SearchByLettersSuccess({required this.products});

  @override
  List<Object> get props => [products];
}
