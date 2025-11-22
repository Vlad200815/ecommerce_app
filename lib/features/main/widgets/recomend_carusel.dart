import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecomendCarusel extends StatelessWidget {
  const RecomendCarusel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String defaultImg =
        "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp";
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 9
                ? _RecomendProductItem(
                    description: "Hello my name is vlad",
                    imgPath: defaultImg,
                    price: 200,
                    productName: "Hello",
                    border: Border(
                      top: BorderSide(
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                        width: 1,
                      ),

                      bottom: BorderSide(
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                  )
                : _RecomendProductItem(
                    description: "Hello my name is vlad",
                    imgPath: defaultImg,
                    price: 200,
                    productName: "Hello",
                    border: Border(
                      top: BorderSide(
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                        width: 1,
                      ),
                      right: BorderSide(
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class _RecomendProductItem extends StatelessWidget {
  const _RecomendProductItem({
    required this.imgPath,
    required this.productName,
    required this.description,
    required this.price,
    required this.border,
  });

  final String imgPath;
  final String productName;
  final String description;
  final double price;
  final Border border;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.push("/more_details"),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: border,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.white, width: 1),
                ),
                child: Image.network(imgPath, fit: BoxFit.fill),
              ),
              const SizedBox(height: 5),
              Text(
                productName,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "$price \$",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
