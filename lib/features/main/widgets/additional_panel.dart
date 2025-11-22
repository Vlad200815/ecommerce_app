import 'package:flutter/material.dart';

class AdditionalPanel extends StatelessWidget {
  const AdditionalPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _AdditionalBox(
              title: "Каталок",
              icon: Icon(Icons.category_outlined, size: 30),
            ),
            _AdditionalBox(
              title: "Каталок",
              icon: Icon(Icons.category_outlined, size: 30),
            ),
            _AdditionalBox(
              title: "Каталок",
              icon: Icon(Icons.category_outlined, size: 30),
            ),
            _AdditionalBox(
              title: "Каталок",
              icon: Icon(Icons.category_outlined, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdditionalBox extends StatelessWidget {
  const _AdditionalBox({required this.title, required this.icon});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.tertiary,
          ),
          child: Padding(padding: const EdgeInsets.all(10), child: icon),
        ),
        Text(title, style: TextStyle(color: theme.colorScheme.secondary)),
      ],
    );
  }
}
