//item itu untuk mendefinidiksn bagaiman asebuah objek akan terjadi
//menjadikan semua object reusable

import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/consts.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.product, required this.press});

  final Product product;//ini itu sub class dari anak anak yg punya banyak data
  final VoidCallback press; //mengasih sebuah feed back ke user


  //mvvm adalah model view - viewModel
  //model itu detail data
  //item itu untuk mendefinidiksn bagaiman sebuah objek akan terjadi
  //menjadikan semua object reusable
  //ui sama view sama
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector( //buat ngedeteksi jari
      onTap: press, //mendorong / klo di tap lama bakal keluar pilihan
      child: Column(
        children: [
          Expanded(//buat mengisi kekosongan yg ada, biar isinya proposinal
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding), //edgeinsets tuh buat padding atau margin
                  decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)
                  ),
                  child: Hero( //memungkinkan trsansisi animasi yg halus, antar halaman pada widgets yg sama
                  tag: "${product.id}", 
                  child: Image.asset(product.image),
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
                  product.title,
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
                "\$ ${product.price}",
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