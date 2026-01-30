import 'package:flutter/material.dart';
import 'package:mini_shop_with_provider/models/product_model.dart';
import 'package:provider/provider.dart';

import '../core/App_Assets.dart';
import '../core/app_colors.dart';
import '../core/app_styles.dart';
import '../providers/products_provider.dart';

class HomeProductItem extends StatelessWidget {
  final ProductModel product;

  const HomeProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProductsProvider>(context);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          color: AppColors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                alignment: .center,
                decoration: BoxDecoration(
                  color: AppColors.imageBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Image.asset(
                  product.image,
                  height: 90,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(product.title, style: AppStyles.main12400),
                    Row(
                      spacing: 10,
                      children: [
                        Image.asset(AppAssets.starIcon),
                        Text(product.rate),
                      ],
                    ),
                    Text("${product.price.floor()} EGP"),
                  ],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            myProvider.addProduct(product);
          },
          icon: Image.asset(
            AppAssets.addToCartIcon,
            width: 40,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
