import 'package:e_commerce/consts.dart';
// import 'package:e_commerce/ui/auth/login_screen.dart';
// import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

//widget extraction itu untuk memisah logic dan juga widget nya, jadi yg diatas itu logic nya yg dibawah itu widgetnya

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController _pageController = PageController(); //for controlling our route yg di page builder ya ga si? bisa jg dibilang buat dia ke catalogue screen

  // List<String> product = List.generate( //wadah prduct atau genarate product
  //   10, (index) => "Product ${index + 1}"
  //   );

  // dasar pengambilan data dari API
  List<Map<String, String>> splashData =[
    {
      "text" : "Beats By Dre",
      "image" : "assets/images/splash_img/splash_01.png",
    },
    {
      "text" : "Premium Wireless Noise Cancelling Headphones",
      "image" : "assets/images/splash_img/splash_02.png",
    },
    {
      "text" : "Beats Studio Pro has a built in Digital-to-Analog Converter (DAC) \n that delivers lossless audio via USB-C.footnote2",
      "image" : "assets/images/splash_img/splash_03.png",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( //for make our project ga kektutupan ama system hpnya
        child: Column(
          children: [      
            Expanded //buat mengisi kekosongan yg ada, biar isinya proposinal
            (
              flex: 3, //untuk ngasih jarak 3 column dan 3 row utk itu berada
              child: SizedBox(// in tuh buat dia buat space gitu lh(jarak antara widget2), kalo tanpa ini ga bisa pake width apa height, dan jg gabisa pake double.infinity
                width: double.infinity,//ini tuh buat bikin ke tengah, jadi dia akan memenuhi layar yg ada, bisa dibilang dia akan ngestract jadi dia bakal ke tengah
                child: PageView.builder( //pageview meng handle swipe swipe activity, builder ngatur/ngambil/membangun data
                  controller: _pageController, //intinya buat nge kontrol ganti page
                  onPageChanged: (value)  { //kalo perlu argument/sesuatu yg mewakili integer kita bisa taro value
                      //initial state method for statefull widfet behavior
                      //state awal utk perubahan yg akan terjadi, di dalam state full ada state method
                      //kalo mengawali statefull behavior
                      setState(() { // set itu perubahan state, untuk perubahan gitu cuenah
                        currentPage = value;// manggil integer representatif yg udh kita panggil di awal, dia mengambil data dari page pertama
                      });
                    },
                  itemCount: splashData.length, //utk menghitung size nya data nya ada berapa
                  itemBuilder: (context, index) => SplashContent( //jembatan antara data ke data ke UI
                    text: splashData[index]["text"]! , //ada tanda seru karna important, bang operator
                    image:  splashData[index]["image"]!
                    )
                  //context mereprentasikan halaman sekarang
                  //index itu, list di akses dengan index
                  //buider bisa di pake dimana aja, disini kita pake di pageview, biar pas
                ),
              ),
            ),
           Expanded(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Aligns the dots in the center
            children: List.generate( //buat ngehasilin dots nya tuh sesuai panjang data yg di splash data
              splashData.length,  //buat panjang dri si splash data nya
              (index) => _dotIndicator(index: index), //disis index aja, karna disini udh jelas kita mau kasih index, dimulai dri nol lagi
              ),
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, //ini tuh buat bikin ke tengah, jadi dia akan memenuhi layar yg ada, bisa dibilang dia akan ngestract jadi dia bakal ke tengah
                child: ElevatedButton( //blm ada styling nya
                  style: ElevatedButton.styleFrom( //buat ngasih style, makanya dipanggil dua kali
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.all(8)
                  ),

                  onPressed: () {
                    if (currentPage == splashData.length - 1) { // min 1 karna dia index, biar data nya ngurang satu, splasdata -> 3 + index = 4
                      // kode yg dipake buat berpindah antar halaman
                      // Aksi untuk halaman terakhir, pindah ke halaman utama
                      //what is length? panjangnya data/banyanknya data

                      // INI PAKE NAMED ROUTE
                      Navigator.pushNamed(context, '/login');

                      // INI GA PAKE NAMED ROUTE
                      // Navigator.push( //kalo push tuh dia buat numpukin, klo pop buat ngebuang si yg ditumpuk dan balik ke yg terakhir kali di tumpuk (screen nya, ini stack ceritanya)
                      //   context, //context itu represantisikan currrent page kita
                      //   MaterialPageRoute(
                      //     builder: (context) => LoginScreen())
                      // );
                      
                    } else {
                        // Berpindah ke halaman splash berikutnya
                        _pageController.animateToPage(
                        currentPage + 1,  // Geser ke halaman berikutnya
                        duration: animationDuration,  // Durasi animasi
                        curve: Curves.easeIn,  // Kurva animasi
                      );

                        
          

                      
                    }
                  },// onpressed for acion,() => {} dummy (represntasi dari function yg kosong) ngasih function mau ke mana
                 //"expresion" kalo di code itu kayak di block code
                  child: Text( 
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    
                    style: const TextStyle(
                      color: Colors.white,
                      
                    ),
                  ),
                 //"intensitas" itu frekuensi
                 
                 
                 ),
              ),
            )
          ],
        ),
        
      )
  
    );
  }

  // ini untuk logika dots indicator (titik tiga)
  AnimatedContainer _dotIndicator({required int index}) {
  return AnimatedContainer(
    duration: animationDuration, // Durasi animasi (300ms)
    curve: Curves.easeInOut, // Kurva animasi untuk transisi yang lebih halus
    
    margin: const EdgeInsets.only(right: 10), // Jarak antar titik
    width: currentPage == index ? 20 : 10, //
    height: 10,
    decoration: BoxDecoration(
      color: currentPage == index ? primaryColor : secondaryColor,  //ini itu if else  Warna titik aktif dan tidak aktif 
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

}



