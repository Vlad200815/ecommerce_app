import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/api/api.dart';
import 'package:ecommerce_app/api/models/product_model.dart';
import 'package:ecommerce_app/api/models/product_search_model.dart';
import 'package:equatable/equatable.dart';

part 'search_by_letters_event.dart';
part 'search_by_letters_state.dart';

class SearchByLettersBloc
    extends Bloc<SearchByLettersEvent, SearchByLettersState> {
  SearchByLettersBloc({required this.apiClient})
    : super(SearchByLettersInitial()) {
    on<OnSearchByLettersEvent>(_onSearchByLettersEvent);
  }

  Future<void> _onSearchByLettersEvent(
    OnSearchByLettersEvent event,
    Emitter<SearchByLettersState> emit,
  ) async {
    emit(SearchByLettersProgress());
    final ProductSearchModel searchResponse = await apiClient.searchProducts(
      event.query,
    );
    final List<ProductModel> products = searchResponse.products;
    try {
      emit(SearchByLettersSuccess(products: products));
    } catch (e) {
      log(e.toString());
      emit(SearchByLettersFailure(error: e));
    }
  }

  final EcommerceApiClient apiClient;
}
