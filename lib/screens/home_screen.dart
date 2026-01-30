import 'package:flutter/material.dart';
import 'package:mini_shop_with_provider/core/App_Assets.dart';
import 'package:mini_shop_with_provider/core/app_colors.dart';
import 'package:mini_shop_with_provider/core/app_styles.dart';
import 'package:mini_shop_with_provider/models/product_model.dart';
import 'package:mini_shop_with_provider/providers/products_provider.dart';
import 'package:mini_shop_with_provider/screens/cart_screen.dart';
import 'package:mini_shop_with_provider/widgets/home_product_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home screen";

  final List<ProductModel> products = [
    ProductModel(
      image: AppAssets.product1Image,
      title: "Samsung 65-Inch Neo QLED 4K Smart TV QA6...",
      brand: "Samsung",
      rate: "4.5 (132 reviews)",
      price: 32899,
    ),
    ProductModel(
      image: AppAssets.product2Image,
      title: "Apple 2025 MacBook Air 13-inch Laptop with....",
      brand: "Apple",
      rate: "4.5 (132 reviews)",
      price: 51000,
    ),
    ProductModel(
      image: AppAssets.product3Image,
      title: "POLAR Ignite 3 GPS Smartwatch iPhone ....",
      brand: "Polar Ignite",
      rate: "4.5 (132 reviews)",
      price: 19500,
    ),
    ProductModel(
      image: AppAssets.product4Image,
      title: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
      brand: "Anker",
      rate: "4.5 (132 reviews)",
      price: 3950,
    ),
    ProductModel(
      image: AppAssets.product5Image,
      title: "HONOR 400 5G Smartphone, 200MP AI ....",
      brand: "Honor",
      rate: "4.5 (132 reviews)",
      price: 21999,
    ),
    ProductModel(
      image: AppAssets.product6Image,
      title: "JBL Go 4 Portable Bluetooth Speaker with I...",
      brand: "JBL",
      rate: "4.5 (132 reviews)",
      price: 1899,
    ),
    ProductModel(
      image: AppAssets.product1Image,
      title: "Samsung 65-Inch Neo QLED 4K Smart TV QA6...",
      brand: "Samsung",
      rate: "4.5 (132 reviews)",
      price: 32899,
    ),
    ProductModel(
      image: AppAssets.product2Image,
      title: "Apple 2025 MacBook Air 13-inch Laptop with....",
      brand: "Apple",
      rate: "4.5 (132 reviews)",
      price: 51000,
    ),
    ProductModel(
      image: AppAssets.product3Image,
      title: "POLAR Ignite 3 GPS Smartwatch iPhone ....",
      brand: "Polar Ignite",
      rate: "4.5 (132 reviews)",
      price: 19500,
    ),
    ProductModel(
      image: AppAssets.product4Image,
      title: "Soundcore by Anker Life Q30 Hybrid Active Noise...",
      brand: "Anker",
      rate: "4.5 (132 reviews)",
      price: 3950,
    ),
    ProductModel(
      image: AppAssets.product5Image,
      title: "HONOR 400 5G Smartphone, 200MP AI ....",
      brand: "Honor",
      rate: "4.5 (132 reviews)",
      price: 21999,
    ),
    ProductModel(
      image: AppAssets.product6Image,
      title: "JBL Go 4 Portable Bluetooth Speaker with I...",
      brand: "JBL",
      rate: "4.5 (132 reviews)",
      price: 1899,
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Image.asset(AppAssets.appLogo),
        centerTitle: false,
        titleSpacing: 40,
        actions: [
          Stack(
            alignment: AlignmentGeometry.topLeft,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: Image.asset(
                  AppAssets.cartIcon,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              if (myProvider.productsCount > 0)
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(myProvider.productsCount.toString()),
                  ),
                ),
            ],
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 20),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: .start,
          spacing: 14,
          children: [
            SizedBox(height: 5),
            Text("Recommendations", style: AppStyles.main16500),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .75,
                ),
                itemBuilder: (context, index) =>
                    HomeProductItem(product: products[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
