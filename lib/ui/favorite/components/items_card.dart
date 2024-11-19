//item itu untuk mendefinidiksn bagaiman asebuah objek akan terjadi
//menjadikan semua object reusable

import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/consts.dart';
// import 'package:e_commerce/ui/detail/detail_screen.dart';
// import 'package:e_commerce/ui/detail/detail_screen.dart';
// import 'package:e_commerce/ui/home/components/categories.dart';
// import 'package:e_commerce/ui/favorite/components/items_card.dart';

class ItemsCard extends StatefulWidget {
  const ItemsCard({super.key, required this.product, required this.press});

  final Product product;//ini itu sub class dari anak anak yg punya banyak data
  final VoidCallback press; 
  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {

 //mengasih sebuah feed back ke user
  @override
  Widget build(BuildContext context) {
    return GestureDetector( //buat ngedeteksi jari
      onTap: widget.press, //mendorong / klo di tap lama bakal keluar pilihan
      child: Column(
        children: [
          Expanded(//buat mengisi kekosongan yg ada, biar isinya proposinal
            child: Stack( //buat di tumpuk2
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding), //edgeinsets tuh buat padding atau margin
                  decoration: BoxDecoration(
                  color: widget.product.color,
                  borderRadius: BorderRadius.circular(16)
                  ),
                  child: Hero( //memungkinkan trsansisi animasi yg halus, antar halaman pada widgets yg sama
                  tag: "${widget.product.id}", 
                  child: Image.asset(widget.product.image),
                  ),
                ),
                Positioned(
                  top: 8, 
                  right: 8, 
                  child: Container(
                    padding: const EdgeInsets.all(2), // Padding di dalem ikon love
                    decoration: const BoxDecoration(
                      color: Colors.white, //ini warna si yg bulet
                      shape: BoxShape.circle, //bentuk yg bg nya tuh kan bulet ya
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border, 
                        size: 20, 
                      ),
                      
                    )
                  ),
                ),
              ],    
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                  widget.product.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "\$ ${widget.product.price}",
                style: const TextStyle(
                fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}