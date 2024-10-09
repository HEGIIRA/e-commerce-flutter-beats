import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

   @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    //definisi ukuran proposional gambar sebagai variable constanta
    const double imageWidthRatio = 0.60; //35% dri lebar layar
    const double imageHeightRatio = 0.28; //ngambil 20% dri tinggi layar
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the start
        children: [
          const Text(
            "Beats Bye Dre", // Static title
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
          ),
          Text(
            product.title, // Dynamic product title
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: defaultPadding), //buat ngasih jarak
          Row(
            children: [
              Expanded( //buat ngisi ruang yg ada
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Price",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                        ),
                    ),
                    Text(
                      "${product.price}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Hero( //biar transisi nya asoy
                tag: "${product.id}", //tag tuh buatmanggil id gabar nya misal
                child: Image.asset(  //child tuh buat widget nya/gambar nyaa
                  product.image,
                  width: size.width * imageWidthRatio, // ratio untuk lebar gambar
                  height: size.height * imageHeightRatio, // ratio untuk tinggi gambar
                  fit: BoxFit.contain, //biar memenuhi box dri image, jdi nnti size image nya sama karna full ke si box nya
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
