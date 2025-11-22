import 'package:flutter/material.dart';

class SubscriptionPanel extends StatelessWidget {
  const SubscriptionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubscriptionBox(
              backgroundColor: const Color.fromARGB(127, 255, 235, 59),
              imgColor: Colors.yellow,
              subTitle: "Підписка Smart",
              title: "Безкоштовна доставка",
            ),
            const SizedBox(width: 10),
            SubscriptionBox(
              backgroundColor: const Color.fromARGB(126, 76, 175, 79),
              imgColor: theme.colorScheme.primary,
              subTitle: "Підписка Smart",
              title: "Безкоштовна доставка",
            ),
          ],
        ),
      ),
    );
  }
}

class SubscriptionBox extends StatelessWidget {
  const SubscriptionBox({
    super.key,
    required this.backgroundColor,
    required this.imgColor,
    required this.subTitle,
    required this.title,
  });

  final Color backgroundColor;
  final Color imgColor;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: imgColor,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 9),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subTitle,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 8),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
