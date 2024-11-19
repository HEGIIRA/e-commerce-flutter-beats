import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier { //extend tuh pewarisan, jdi change notifier nurunin warisan ke ThemeProvider
  bool _isDarkTheme = false;

  ThemeProvider() { //ini bukn function, nah knp si _loadTheme() dimasukin ke
    _loadTheme(); //buat ngelakuin perubahan tema
  }

  // TODO - pr  buat nginget, ini tuh sebernya apa sii?
  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool("isDarkTheme", isDark);
    notifyListeners();
  }

  void _loadTheme() async {
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