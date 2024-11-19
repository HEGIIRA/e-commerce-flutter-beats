import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Favorite'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b0aecb4c-3e97-4080-a944-dcbd89af7ee7/WMNS+AIR+JORDAN+1+RETRO+HI+OG.png',
            title: 'Nike Jordan',
            price: '\$58.7',
            isBestSeller: true,
            colors: [Colors.yellow, Colors.teal],
          ),
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d7yyh7rta3tkye7kdyka/NIKE+AIR+MAX+97.png',
            title: 'Nike Air Max',
            price: '\$37.8',
            isBestSeller: true,
            colors: [Colors.lightBlue, Colors.grey],
          ),
          _buildFavouriteItem(
            imageUrl: 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/032dda17-1d87-4c4f-bcad-6a64728c9342/NIKE+AIR+MAX+SCORPION+FK+SE.png',
            title: 'Nike Club Max',
            price: '\$47.7',
            isBestSeller: true,
            colors: [Colors.blue, Colors.yellow],
          ),
          _buildFavouriteItem(
            imageUrl: 'https://cdn-images.farfetch-contents.com/20/20/64/46/20206446_50082398_2048.jpg',
            title: 'Nike Air Max',
            price: '\$57.6',
            isBestSeller: true,
            colors: [Colors.teal, Colors.blue],
          ),
        ],
      ),
    );
  }

  Widget _buildFavouriteItem({
    required String imageUrl,
    required String title,
    required String price,
    required bool isBestSeller,
    required List<Color> colors,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network (imageUrl, fit: BoxFit.cover),
              if (isBestSeller)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Colors.black,
                    child: const Text(
                      'BEST SELLER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}