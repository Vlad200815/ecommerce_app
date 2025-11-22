import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DescriptionAppBar extends StatelessWidget {
  const DescriptionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 50,
      backgroundColor: theme.colorScheme.surface,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back, color: AppColors.white),
      ),
      title: Text(
        "Опис товару",
        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w800),
      ),
      actions: [
        IconButton(
          onPressed: () => "/search",
          icon: Icon(Icons.search, color: AppColors.white),
        ),
        IconButton(
          onPressed: () => "/cart",
          icon: Icon(Icons.shopping_cart_outlined, color: AppColors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: AppColors.white),
        ),
      ],
    );
  }
}
