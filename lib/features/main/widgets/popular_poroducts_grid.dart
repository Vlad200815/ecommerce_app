import 'package:ecommerce_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PopularPoroductsGrid extends StatelessWidget {
  const PopularPoroductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String defaultImg =
        "https://cdn.dummyjson.com/product-images/beauty/essence-mascara-lash-princess/thumbnail.webp";
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.crossAxisExtent;
        return SliverGrid.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: maxWidth > 600 ? 3 : 2,
            childAspectRatio: 16 / 20,
          ),
          itemBuilder: (context, index) {
            return index % 2 != 0
                ? _PopularProductItem(
                    description: "Hello, my name is Vlad",
                    productName: "Hello",
                    imgPath: defaultImg,
                    price: 230,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                      ),
                      top: BorderSide(
                        width: 1,
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                      ),
                    ),
                  )
                : _PopularProductItem(
                    description: "Hello, my name is Vlad",
                    productName: "Hello",
                    imgPath: defaultImg,
                    price: 230,
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                      ),
                      top: BorderSide(
                        width: 1,
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                      ),
                      right: BorderSide(
                        width: 1,
                        color: theme.colorScheme.secondary.withOpacity(0.3),
                      ),
                    ),
                  );
          },
        );
      },
    );
  }
}

class _PopularProductItem extends StatelessWidget {
  const _PopularProductItem({
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
  final BoxBorder border;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: border),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
