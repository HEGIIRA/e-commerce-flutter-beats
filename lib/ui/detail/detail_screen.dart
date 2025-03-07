import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/components/add_to_cart.dart';
import 'package:e_commerce/ui/detail/components/cart_counter.dart';
import 'package:e_commerce/ui/detail/components/color_and_size.dart';
import 'package:e_commerce/ui/detail/components/description.dart';
import 'package:e_commerce/ui/detail/components/fav_button.dart';
import 'package:e_commerce/ui/detail/components/product_title.dart';
import 'package:e_commerce/ui/favorite/wishlist_screen.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    //biar si widget nya responsive, sesuai denga size si device nya
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishlistScreen())
              );
            }, 
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen())
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
       child: Column(
        children:<Widget>[
          // ProductTitle(product: product),
          SizedBox( //jarak antar widget
            height: size.height,
            child: Stack(
              children: [
                Container(
                  //buat ngambil 30% dri tinggi layar
                   //ini harus di kalikan 0.3 biar top margin nya jdi 30% karna biar yg putih tuh ngasih ruang sebanyak 30% buat yg biruu
                  margin: EdgeInsets.only(top: size.height * 0.35),
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding / 2, // Adjust padding for better spacing
                    ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)
                    )
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      ColorAndSize(product: product),
                      const SizedBox(height: defaultPadding),
                      Description(product: product),
                      const SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(product: product),
                          FavButton(product: product),
                        ],
                      ),
                      
                      const SizedBox(height: defaultPadding / 2),
                      AddToCart(product: product, quantity: quantity)
                    ],
                  ),
                ),
                // title widget placed above the image
                Positioned( //widget yg berguna buat ngatur tata letak widget secara spesifik
                            //position tuh hrus pake stack tpi diluar container
                  top: size.height * 0.05,
                  left: defaultPadding,
                  right: defaultPadding,
                  child: ProductTitle(product: product),
                )
              ],
            ),
          )
        ],
       ),
      ),
    );
  }
}