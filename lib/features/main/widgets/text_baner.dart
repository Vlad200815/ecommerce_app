import 'package:flutter/material.dart';

class TextBaner extends StatelessWidget {
  const TextBaner({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 15),
      sliver: SliverToBoxAdapter(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
      ),
    );
  }
}
