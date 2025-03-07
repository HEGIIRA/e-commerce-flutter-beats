import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context, listen: true); //sbnrnya gausah ditulis true jg dia udh default nya true.
    final isFavorite = wishlistProvider.wishlistItem.containsKey(product.id.toString());
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          //untuk menghapus item dari wishlist klo di klik lagi
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else {
          
          wishlistProvider.addItemToFav(
            //ini toString karna diambil dri product yg dimana asalnya id tuh int, sedangkan additemToFav mintanya string, knp minta string?
          product.id.toString(),  //knp dri sananya nggak diubah jdi string ae? karna size string lbih gede dri int
          product.title,
          product.price,
          product.image
        );
        }
      }, 
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey,
        
      )
    );
  }
}