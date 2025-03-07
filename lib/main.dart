import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/favorite/wishlist_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/profile/profile_screen.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//shift + alt + o

//download extension
// - adb interface
// - error lense
// - prettier
// - flutter widget snipeads

void main() {
  runApp(
    MultiProvider( //ini pke widget, biar bisa manggil banyak provider
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const FloShop()
    )
  );
}

//klo stf dijalanin yg pertama dijalanin tuh yg di initstate
//initstate tuh bwt ngebantu dan nge inisialisasi state nya

class FloShop extends StatefulWidget {
  const FloShop({super.key});

@override
State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {


  @override
  Widget build(BuildContext context) {
    return  Consumer<ThemeProvider>( //klo ada perubahan theme, maka akan diupdate
      builder: (context, themeProvider, child) { 
        return MaterialApp(
        // material app = kerangka
        debugShowCheckedModeBanner: false,
        title: 'Beats',
        //untuk mnegindetified
        //ada super class dan subclass
        //()yg ada gitunya itu parametear
        theme: ThemeData( //ini tuh buat ngasih tema light atau dark
          brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
          scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
          fontFamily: 'Muli',
          // biar density atau kepadetan mobile app nya, buat adaptive di semua devices (responsif)
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: textColor),
            bodySmall: TextStyle(color: textColor)
          )
        ),
      
          //INI NAMED ROUTE, BIAR YG DIPANGGIL CUMN INISIALNYA AJA
          initialRoute: '/',
          routes: {
            //format pasangan key : value => rute : kelas yg dituju
          //nah ini pas dipanggil di file lain gausah dipanggil first screen nya, tpi tingal tulis si alias nya yaitu ('/') dan ini bisa diganti2 terserah kita
          '/' : (context) => const SplashScreen(), //nah inikan ada '/', brarti screen yg muncul prtama kli ya si first screen ini
          '/login' : (context) => LoginScreen(),
          '/catalogue' : (context) => const CatalogueScreen(), //ini penamaannya hrus beda, karna yg tdi tuh unik, identik, beda dri yg lain
          // '/detail' : (context) => const DetailScreen(product: product),
          '/profile' : (context) => const ProfileScreen(),
          '/favorite' : (context) => const WishlistScreen(),
          '/settings' : (context) => const SettingsScreen(),
        },
        );
      },
    );
  }
}