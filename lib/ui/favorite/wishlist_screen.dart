import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Wishlist"),
      // ),

      body: wishListProvider.wishlistItem.isEmpty
      ? const Center(child: Text("Your Wishlist is empty")) 
      : ListView.builder(
        itemCount: wishListProvider.wishlistItem.length,
        itemBuilder: (context, index) {
          final wishListItem = wishListProvider.wishlistItem.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            //listtile buat menghasilkan list
            child: ListTile(  
              //leading itu buat kiri
              leading: CircleAvatar(
                backgroundImage: AssetImage(wishListItem.image),
              ),
              title: Text(wishListItem.title),
              //trailing buat sebelah kanan
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  wishListProvider.removeItemFromFav(wishListItem.id);
                }
                ),
            ),
            
          );
        },
      
      ),
      
    );
  }
}