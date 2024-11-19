import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account & Settings'),
        leading: IconButton( //leading tuh emg properti yg ada di widget appbar, dan ini emg buat nampilin sesuatu dri awal (kiri)
          onPressed: () {}, 
          icon: const Icon(Icons.arrow_back)
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            }, 
            icon: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
             color: themeProvider.isDarkTheme ? Colors.blue : Colors.amber,
            )
          )
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // INI BUAT ACCOUNT
          Padding(
            padding: EdgeInsets.only(left: defaultPadding, top: defaultPadding),
            child: Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          AccountSettings(icon: Icons.notifications_active_outlined, text: "Notification Settings",),
          AccountSettings(icon: Icons.notifications_active_outlined, text: "Notification Settings",),
          AccountSettings(icon: Icons.notifications_active_outlined, text: "Notification Settings",),
          
         
          ListTile( //gatau sih, tpi katanya biar rapih (kyk udh di kotakin gitu, kanan kiri dan tengah, jdi semuanya rata)
            leading: Icon(Icons.shopping_cart_outlined), //dia kan icon nya di awal
            title: Text('Shipping Address'),
            trailing: Icon(Icons.arrow_forward_ios), //icon nya di akhir
          ),
          Divider( //NAH INI buat si garis nya, dia kan buat pemisah gituloo
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),

          // INI BUAT APP SETTINGS
          Padding(
            padding: EdgeInsets.only(top: 50, left: defaultPadding),
            child: Text(
              'App Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),

          ListTile( //gatau sih, tpi katanya biar rapih (kyk udh di kotakin gitu, kanan kiri dan tengah, jdi semuanya rata)
            title: Text('Eneble Face ID For Log In'),
            // trailing: Switch(
            //   value: _, 
            //   onChanged: onChanged
            // ) //icon nya di akhir
          ),
          Divider( //NAH INI buat si garis nya, dia kan buat pemisah gituloo
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class AccountSettings extends StatelessWidget {
  final String text;
  final  IconData icon;
  
  const AccountSettings({
    super.key, required this.text, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const ListTile( //gatau sih, tpi katanya biar rapih (kyk udh di kotakin gitu, kanan kiri dan tengah, jdi semuanya rata)
              leading: Icon(Icons.account_balance_wallet_outlined), //dia kan icon nya di awal
              title: Text('Payment Info'),
              trailing: Icon(Icons.arrow_forward_ios), //icon nya di akhir
            ),
            Icon(icon),
            // Padding(padding: defaultPadding)
            const SizedBox(width: 10,),
            Text(text),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
        const Divider()
      ],
    );
  }
}