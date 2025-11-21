import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/features/main/widgets/widgets.dart';
import 'package:ecommerce_app/features/blocs/search_by_letters_bloc/search_by_letters_bloc.dart';
import 'package:ecommerce_app/features/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  //TODO: make for this func its own service
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      log("Time is out!!!");
      if (query.isNotEmpty) {
        context.read<SearchByLettersBloc>().add(
          OnSearchByLettersEvent(query: query),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Carusel(),
          SubscriptionPanel(),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: SearchField(onChanged: _onSearchChanged),
            ),
          ),
          AdditionalPanel(),
        ],
      ),
    );
  }
}
