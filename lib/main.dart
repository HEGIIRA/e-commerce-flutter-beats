import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

//shift + alt + o

//download extension
// - adb interface
// - error lense
// - prettier
// - flutter widget snipeads

void main() {
  runApp(const FloShop());
}

class FloShop extends StatelessWidget {
  const FloShop({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // material app = kerangka
      debugShowCheckedModeBanner: false,
      title: 'Beats',
      //untuk mnegindetified
      //ada super class dan subclass
      //()yg ada gitunya itu parametear
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        // biar density atau kepadetan mobile app nya, buat adaptive di semua devices
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor)
        )
      ),

      home: const SplashScreen(),
    );
  }
}