import 'package:ecommerce_app/features/main/widgets/widgets.dart';
import 'package:ecommerce_app/features/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              child: SearchField(onTap: () => context.go("/search")),
            ),
          ),
          AdditionalPanel(),
          TextBaner(text: "Рекомендації на основі ваших переглядів"),
          RecomendCarusel(),
          TextBaner(text: "Найкраці пропозиції"),
          PopularPoroductsGrid(),
        ],
      ),
    );
  }
}
