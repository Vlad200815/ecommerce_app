import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNav extends StatefulWidget {
  const ScaffoldWithNestedNav({Key? key, required this.navigationShell})
    : super(key: key ?? const ValueKey("ScaffoldWithNestedNav"));

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNestedNav> createState() => _ScaffoldWithNestedNavState();
}

class _ScaffoldWithNestedNavState extends State<ScaffoldWithNestedNav> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navCol,
        currentIndex: widget.navigationShell.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _goBranch,
        selectedItemColor: theme.primary,
        unselectedItemColor: theme.secondary,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.manage_search_sharp),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "Likes",
            icon: Icon(Icons.favorite_border_rounded),
          ),
          BottomNavigationBarItem(
            label: "More",
            icon: Icon(Icons.manage_accounts),
          ),
        ],
      ),
    );
  }
}
