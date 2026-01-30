import 'package:flutter/material.dart';
import 'package:mini_shop_with_provider/core/app_styles.dart';
import 'package:mini_shop_with_provider/models/product_model.dart';
import 'package:provider/provider.dart';

import '../core/app_colors.dart';
import '../providers/products_provider.dart';
import '../widgets/cart_product_item.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "cart screen";
  final double shippingFee = 0;

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProductsProvider>(context);

    List<ProductModel> products = myProvider.selectedProducts;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("My Cart", style: AppStyles.main18600),
        centerTitle: true,
        titleSpacing: 40,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: products.isEmpty
          ? Center(
              child: Text("No product founded", style: AppStyles.main18600),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 16,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text("Items Total", style: AppStyles.sec16400),
                            Row(
                              children: [
                                Text(
                                  "EGP ${myProvider.totalPrice.floor()}",
                                  style: AppStyles.main12500,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text("Shipping Fee", style: AppStyles.sec16400),
                            Text(
                              shippingFee == 0
                                  ? "FREE"
                                  : shippingFee.floor().toString(),
                              style: AppStyles.green14600,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text("Total", style: AppStyles.sec16400),
                            Row(
                              children: [
                                Text(
                                  "EGP ${myProvider.totalPrice.floor() + shippingFee.floor()}",
                                  style: AppStyles.main12500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${myProvider.productsCount} Items",
                    style: AppStyles.main14500,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          CartProductItem(product: products[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10),
                      itemCount: products.length,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(16),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Checkout"),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
    );
  }
}
