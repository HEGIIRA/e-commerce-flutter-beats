import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/favorite/wishlist_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_navbar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:e_commerce/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  // Daftar tampilan untuk setiap tab
  final List<Widget> _widgetOptions = [
    const CatalogueScreen(), // Home
    const WishlistScreen(),   // Wishlist
    const SettingsScreen(), // Settings 
    const ProfileScreen(),   // Profile
  ];

   //changeNotifier tuh buat meng enkapsukapsulasi

  //kangkah implementasi state management. 
  //step 1 : import library buat state management di pubspec.yaml
  //step 2 : tambahkan ChangeNotifier di file terkait (bikin folder baru lib -> state management -> (file) anu_provider.dart)
  // kalo pke api tambahin 'API' dan ttp pke changenotifier
            //changeNotifier tuh class wajib hrus extend dgn class terkait
  //step 3 : adjusting main.dart, dri main dart di implementasikan ke file provider

  //function untuk aksi tap pada bottom navbar
  void _onItemTapped(int index) {
    setState(() {
      //nyatain initial action bakal nampilin objek yg berada  di index ke-0
      _selectedIndex = index;
    });
  }


//bedanya list sma map.
//list tuh cumn list aja gitu, array
//klo map uh udh otomatis tipe data nya dynamic, defaultnya dynamic tpi bisa diubah
//trus juga map tuh pasangan key value
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0, //buat z kordinate , biar z nya tuh nol, meghilangkan efek bayangan
        actions: [
          IconButton(
          onPressed: () {},  //ini dummy function biar ga error, itu () buat function nya dan {} buat blok kode nya
                              //tpi blom jelas klo di klik bakal melakukan function apa.
          icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen())
                );
              }, 
              icon: const Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),

       //NAH INI TERNARY CONDITIONS
        body: _selectedIndex == 0 // ini kan kalo if else, if klo _selectedIndex == 0, maka kerjainyg di bawah ini
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start, //buat lawan arah sama default
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(
                    "Women",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),

                // INI KATEGORI
                const Categories(), //buat nampilin viewpager

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: GridView.builder( //main axist bakal selalu ngikutin parent nya coy || gridview itu kembaran listview, klo list mah kan gitu bisa row ama col, klo grid bentuk nya kotak2
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // buat ngatur tata letak grid //buat ngebungkus widget biasa biar bisa ditempatin dalam custom scroll view (lebih banyak opsi dripada ) //cross itu sebaliknya dri main, cross nya row brarrti column, main nya ttp row, dan sebaliknya.
                        crossAxisCount: 2,  //jarak horizontal
                        mainAxisSpacing: defaultPadding,
                        crossAxisSpacing: defaultPadding,
                        childAspectRatio: 1.20,  //buat perbandingan tinggi 
                      ),
                      itemCount: product.length, //buat ambil data dri data product
                      itemBuilder: (context, index) => ItemsCard( //buat pindah page
                        product: product[index],
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute( //buat pindah halaman, knp msih pke ini pdhl ada push? gtau, dah sepaket kali
                            builder: (context) => DetailScreen(product: product[index]),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )

            //NAH INI ELSE NYA, klo index nya bukan 0 makan krjakn yg dibawah ini
          : _widgetOptions[_selectedIndex], // Tampilkan widget berdasarkan index
        bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      )
    );
  }
}