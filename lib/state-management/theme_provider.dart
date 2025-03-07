import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//set statement tuh penting, dia tuh buat ngatur suatu nilai variable.
//jenis nya : stateful -> enkapsulasi, provider, bloc, getx, riverpod (stl ga masuk => cumn buat nampilin ui aja)
//kode klo public brarti bisa di akses di file lain
//knp provider? : gampang bwt pemula, populer, yg rame dipake skrg


//state management => kelas yang berfungsi untuk membnatu mengelola UI, membantu mengelola data yang dinamis, 
//membantu mengurangi adanya boiler plate/kode yg ditulis secara berulang agar kode yg ditulis menjadi efisien 
//dan mudah di maintain (dikelola)

//setter dan getter tuh best practice

//INI Inheritens (pewarisan) pke extend
//konsep OOP tergampang --> inheritance
class ThemeProvider extends ChangeNotifier { //extend tuh pewarisan, jdi change notifier nurunin warisan ke ThemeProvider
  //INI SETTER (lebih penting), bersifat private, cumn bia dipake di file ini.
  bool _isDarkTheme = false;
  
  //set = ngatur, ini variable udh kita set sebagai bool false

  ThemeProvider() { //ini bukn function, nah knp si _loadTheme() dimasukin ke
    _loadTheme(); //buat ngelakuin perubahan tema
  }

  //INI GETTER bersifat public, (alias) buat dipanggil di file lain
  bool get isDarkTheme => _isDarkTheme; //kayak ngubah nama dri yg ada _ jdi gaada
  //setter tuh bisa tanpa getter, sedangkan getter gbisa tnpa setter.
  //INTINYA BEDANYA setter ama Getter tuh = Setter -> private, getter -> public

  void toggleTheme(bool isDark) async {
    //shared preferences buat ngehandle konfigurasi perubahan
    SharedPreferences prefs = await SharedPreferences.getInstance(); //ini syntax klo manggil sharedPreferences klo mw ambil data lokal (gaada ilmu nya ngapa gini nulisnya, udh dri sananya)
    _isDarkTheme = isDark;
    await prefs.setBool("isDarkTheme", isDark);
    notifyListeners(); //(wajib) dia fungsinya buat nge record apapun yg di handle provider
    //klo pke provider wajib = notifyListeners(), dan 
    //klo di cmnd klik dia tuh punyanya changenotifier
    //changeNotifier tuh kyk nge handle banyak hal, dia nyuruh lagi ke notifyListeners, karna yg sbnrnya kerja tuh si notifyListeners
  }

  void _loadTheme() async {
    //shared preferences tuh plugin buat nyimpen data dalam bentuk key-value secraa lokal
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //?? is elvis operator : buat defining default di variable kita (penjegahan NPE [Null Pointer Exception])
    _isDarkTheme = prefs.getBool("isDarkTheme") ??  false;
    notifyListeners();
  }
}

//klo boiler plate = mendefinisikan 1 atau objek berulang kali, pdh kan bisa extract
//INI FILE WAJIB 
//Compile adalah klo running proses penerjemahan dri bahasa koding ke bahasa mesin.
//klo runtime tuh alatnya, di vscode udh tertanam, alat buat penerjemah