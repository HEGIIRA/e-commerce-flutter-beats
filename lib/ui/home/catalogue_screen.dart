import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
// import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, //buat z kordinate , biar z nya tuh nol, meghilangkan efek bayangan
        actions: [
          IconButton(
            onPressed: () {}, //ini dummy function biar ga error, itu () buat function nya dan {} buat blok kode nya
                              //tpi blom jelas klo di klik bakal melakukan function apa.
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {}, //ini dummy function biar ga error, itu () buat function nya dan {} buat blok kode nya
                              //tpi blom jelas klo di klik bakal melakukan function apa.
            icon: const Icon(Icons.shopping_cart_checkout_outlined)
          )
        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start, //buat lawan arah sama default
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Women",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          const Categories(), //buat nampilin viewpager
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder( //main axist bakal selalu ngikutin parent nya coy || gridview itu kembaran listview, klo list mah kan gitu bisa row ama col, klo grid bentuk nya kotak2
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // buat ngatur tata letak grid //buat ngebungkus widget biasa biar bisa ditempatin dalam custom scroll view (lebih banyak opsi dripada ) //cross itu sebaliknya dri main, cross nya row brarrti column, main nya ttp row, dan sebaliknya.
                  crossAxisCount: 2, //jarak horizontal
                  mainAxisSpacing: defaultPadding, 
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75  //buat perbandingan tinggi 
                ), 
                itemCount: product.length, //buat ambil data dri data product
                itemBuilder: (context, index) => ItemsCard( //buat pindah page
                  product: product[index], 
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute( //buat pindah halaman, knp msih pke ini pdhl ada push? gtau, dah sepaket kali
                      builder: (context) => DetailScreen(product: product[index])
                    )
                  )
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}