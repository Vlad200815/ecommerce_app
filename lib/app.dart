import 'package:ecommerce_app/router/router.dart';
import 'package:ecommerce_app/theme/theme.dart';
import 'package:flutter/material.dart';

class EmommerceApp extends StatelessWidget {
  const EmommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      routerConfig: myRouter,
    );
  }
}
