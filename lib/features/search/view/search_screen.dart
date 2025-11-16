import 'dart:async';
import 'dart:developer';
import 'package:ecommerce_app/api/api.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/features/search/blocs/search_by_letters_bloc/search_by_letters_bloc.dart';
import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final String defaultImg =
      "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp";
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      log("Working");
      if (query.isNotEmpty) {
        context.read<SearchByLettersBloc>().add(
          OnSearchByLettersEvent(query: query),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final api = getIt<EcommerceApiClient>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await api.searchProducts("a");
          log(response.products[0].title.toString());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            TextField(
              controller: _searchController,
              onChanged: (value) {
                _onSearchChanged(value);
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "I am seeking for...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchByLettersBloc, SearchByLettersState>(
                builder: (context, state) {
                  if (state is SearchByLettersSuccess) {
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: theme.colorScheme.tertiary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: Image.network(
                                        state.products[index].thumbnail ??
                                            defaultImg,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${state.products[index].title}, ",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "${state.products[index].description}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "${state.products[index].price}\$",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is SearchByLettersFailure) {
                    return Center(child: Text(state.error.toString()));
                  } else if (state is SearchByLettersProgress) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
