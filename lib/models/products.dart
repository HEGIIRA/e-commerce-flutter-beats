// import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';


//ini satu-satunya acuan untuk data yang digaunakan 
class Product {
  //ini itu untuk modelnya
  //model itu apa??
  //model itu data nya

  final String image, title, description;
  final int size, id, price;
  final Color color;
  // final double price;

  Product({
     // this adalah, untuk manandakan bahwa object terkait hanya bisa di akses oleh class terkait
      //atau class yg sebelumnya memanggil product
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

 List<Product> product = [
  Product(
      id: 1,
      title: "Beats Studio Pro",
      price: 3499,
      size: 12,
      description: dummyText,
      image: "assets/images/product_img/p_1.png",
      color: const Color.fromARGB(212, 221, 194, 182)),
  Product(
      id: 2,
      title: "Beats Solo 4",
      price: 1999,
      size: 8,
      description: dummyText,
      image: "assets/images/product_img/p_2.png",
      color: Color.fromARGB(194, 209, 180, 198)),
  Product(
      id: 3,
      title: "Beats Studio Buds +",
      price: 1699,
      size: 10,
      description: dummyText,
      image: "assets/images/product_img/p_3.png",
      color: const Color.fromARGB(255, 151, 148, 147)),
  Product(
      id: 4,
      title: "Beats solo Buds",
      price: 7999,
      size: 11,
      description: dummyText,
      image: "assets/images/product_img/p_4.png",
      color: const Color.fromARGB(232, 176, 178, 211)),
  Product(
      id: 5,
      title: "Beats Fit Pro",
      price: 1999,
      size: 12,
      description: dummyText,
      image: "assets/images/product_img/p_5.png",
      color: const Color.fromARGB(232, 219, 218, 218)),
  Product(
    id: 6,
    title: "Beats Flex",
    price: 6999,
    size: 12,
    description: dummyText,
    image: "assets/images/product_img/p_6.png",
    color: const Color.fromARGB(232, 159, 203, 223),
  ),
  Product(
    id: 6,
    title: "Beats Pill",
    price: 1499,
    size: 12,
    description: dummyText,
    image: "assets/images/product_img/p_7.png",
    color: const Color.fromARGB(232, 196, 187, 184),
  ),
];

String dummyText =
    "Beats Studio Pro Premium Wireless Noise Cancelling Headphones, Beats’ custom acoustic platform delivers rich, immersive sound, Portable, lightweight design, UltraPlush engineered leather cushions for extended comfort and durability";

String descriptionText = "ikan sepat ikan cucut, aku suka lino";
