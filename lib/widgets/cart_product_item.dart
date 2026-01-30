import 'package:flutter/material.dart';
import 'package:mini_shop_with_provider/models/product_model.dart';
import 'package:mini_shop_with_provider/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../core/App_Assets.dart';
import '../core/app_colors.dart';
import '../core/app_styles.dart';

class CartProductItem extends StatelessWidget {
  final ProductModel product;

  const CartProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProductsProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Row(
            spacing: 16,
            children: [
              Container(
                height: double.infinity,
                width: 80,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.imageBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(product.image),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(product.brand, style: AppStyles.main16600),
                    Text(
                      product.title,
                      style: AppStyles.main12400,
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                    Text("EGP ${product.price.floor()}"),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: .end,
            mainAxisAlignment: .spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  myProvider.removeProduct(product);
                },
                child: Image.asset(
                  AppAssets.deleteIcon,
                  width: 40,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                width: 100,
                height: 35,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.strokeColor),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        myProvider.decreaseQuantity(product);
                      },
                      child: Image.asset(
                        AppAssets.minusIcon,
                        fit: BoxFit.fitHeight,
                        height: double.infinity,
                      ),
                    ),
                    Text(product.amount.toString()),
                    InkWell(
                      onTap: () {
                        myProvider.increaseQuantity(product);
                      },
                      child: Image.asset(
                        AppAssets.addIcon,
                        fit: BoxFit.fitHeight,
                        height: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
