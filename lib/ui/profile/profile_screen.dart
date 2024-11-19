import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/ui/profile/components/profile_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> navItems = [
    //yg di '' tuh key, trus isi nya tuh value
    {'icon' : Icons.home, 'label' : "Home"},
    {'icon' : Icons.favorite, 'label' : "Wishlist"},
    {'icon' : Icons.settings, 'label' : "Setting"},
    {'icon' : Icons.person, 'label' : "Profile"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.arrow_back_ios_new)
        ),
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.edit)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, //biar di atas
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 160,
              child: Stack(
                children: [

                  //INI BUAT SI FOTO NYA
                  CircleAvatar( //ini pake ini yg bikin gambar jdi bulet
                    radius: 70, //ini radius buat nentuin si lengkungan nya //NGGAK DENG, INI BUAT UKURAN SI CIECLE AVATAR
                    backgroundImage: const AssetImage('assets/images/hik.jpg'), //ini si foto yg bakal di tampilin, bisa lewat link juga, tpi disini ak pke asset
                    backgroundColor: Colors.grey.shade200, //ini tuh bke bg color klo semisal si foto pp nya gaada jdinya dia bakal munculin si bg alias abu
                  ),

                  // INI BUAT ICON CAMERA NYA
                  Positioned(
                  top: 115, //ini posisi nya
                  right: 50, 
                  child: Container(
                    //padding: const EdgeInsets.all(1), // Padding di dalem ikon nya
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 84, 168, 238), //ini warna si yg bulet
                      shape: BoxShape.circle, //bentuk yg bg nya tuh kan bulet ya
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_camera_rounded, 
                        size: 25, 
                        color: Colors.white,
                      ),
                    )
                  ),
                  ),
                
                ],
              )
            ),
            
            const Text(
              'Hegi',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),

            const SizedBox(height: 30),
            // ini kan manggil si info nya, nah ini ada parameter yg wajib diisi
            const ProfileInfo(
            name:'Hegira Mecca', 
            email: 'hegi@gmail.com', 
            password: 'rahmatahalu asik'
            )
          ],
        ),
      ),
      
    );
  }
 

  
}