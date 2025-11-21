import 'package:ecommerce_app/api/api.dart';
import 'package:ecommerce_app/di/di.dart';
import 'package:ecommerce_app/features/blocs/search_by_letters_bloc/search_by_letters_bloc.dart';
import 'package:ecommerce_app/router/router.dart';
import 'package:ecommerce_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmommerceApp extends StatelessWidget {
  const EmommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = getIt<EcommerceApiClient>();
    return BlocProvider(
      create: (context) => SearchByLettersBloc(apiClient: apiClient),
      child: MaterialApp.router(
        title: 'Ecommerce App',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        routerConfig: myRouter,
      ),
    );
  }
}
