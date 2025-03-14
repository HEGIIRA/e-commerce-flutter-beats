import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatelessWidget {
  //di komen dulu, knp ga dihapus aja const nya? karna const yg ini dri sananya udh wajib
  // const LoginPage({super.key});   

//ini tuh udh tersedia dri library nya
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final FToast fToast = FToast();

  //key tuh pertanda klo dia tuh bisa dipanggil, unik
  // knp halaman auth dihubungkan sama debugging?
  // klo mau nyari error bakal muncul di devtools
  //perbedaan text editor dan ide, klo ide tools nya lebih lengkap

  @override
  Widget build(BuildContext context) {
    //ini buat menginisialisasi ftoast dengan context, INI WAJIB klo engga gaakan muncul di layar
    fToast.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: const Text(
          'Register',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
        backgroundColor: primaryColor,
      ),

      body: Container(
        height: double.infinity, //buat mengisi seluruh layar
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey.shade100
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft
          )
        ),
        child: Padding( //
          padding: const EdgeInsets.all(16.0), //all tuh jarak di semau sisi
          child: Form(
            key: _formKey, //ini buat manggil si global key / id nya
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create an Account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField( //ini buat form isi2 an nya
                  controller: _nameController, //controller tuh buat nge controller 
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) { //ini klo value nya kosong ATAU emg si user nya ga ngisi gitu
                      return "Name is required"; //bakal muncul ini
                    }
                    return null; //ini tuh brarti klo dah kekirim/keterima, kan jdi ga muncul warning gitu kan, karna ya ga knp2, return nya jg lgnsng pindah tuh krna data nya jg pindah
                  },
                ),
                const SizedBox(height: 20),
                TextFormField( //ini buat form isi2 an nya
                  controller: _emailController, //controller tuh buat nge controller 
                  decoration: const InputDecoration(
                    labelText: "Email*",
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty) { //ini klo value nya kosong ATAU emg si user nya ga ngisi gitu
                      return "Email is required"; //bakal muncul ini
                    }//karna ada operator not/bang (!) brarti jdi negatif
                    if(!value.endsWith("@gmail.com")) { //ini klo emailnya ga ada @
                      return "Please fill with a valid email"; //bakal muncul ini
                    }
                    return null; //ini tuh brarti klo dah kekirim/keterima, kan jdi ga muncul warning gitu kan, karna ya ga knp2, return nya jg lgnsng pindah tuh krna data nya jg pindah
                  }
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, //ini buat ngasih bintang2 pas masukin pw
                  decoration: const InputDecoration(
                    labelText: "Password*",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 40),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                BorderRadius.circular(12), // Radius sudut
                            ),
                      ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // klo validation nya sukses bakal nunjukin toast/pop up
                        //jadinya kita pke fToast karna biar bisa lebih di ubah2
                        fToast.showToast( //fToast ini subclass dari flutterToast
                          child: Container(
                           padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 20.0), //inin nihh buat jarak padding nya, klo mau lbih besar tuh
                           decoration: BoxDecoration( //nah ini buat nge dekor si box nya, warna, radius, gitu2
                            color: const Color.fromARGB(255, 19, 19, 19), //ini warna bg nya
                            borderRadius: BorderRadius.circular(8.0), //ini si radius/lengkungan kotak
                           ),
                           child: const Text(
                             "Successfully Register!",
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                           ),
                          ),
                        gravity: ToastGravity.BOTTOM,
                        toastDuration: const Duration(seconds: 2),
                    );
                      
                      //INI PUNYA HEGI
                      // Widget toast = Container( 
                      //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0), //inin nihh buat jarak padding nya, klo mau lbih besar tuh
                      //   decoration: BoxDecoration( //nah ini buat nge dekor si box nya, warna, radius, gitu2
                      //     borderRadius: BorderRadius.circular(8.0), //ini si radius/lengkungan kotak
                      //     color: const Color.fromARGB(255, 19, 19, 19), //ini warna bg nya
                      //   ),
                        // child: const Row( //
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     SizedBox(width: 10.0),
                        //     Text("Register Success", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                        //   ],
                        // ),
                      //   child: const Text(
                      //     "Login Success",
                      //     style: TextStyle(color: Colors.white),
                      //     textAlign: TextAlign.center,
                      //   ),
                      // );
        
                 
                      // Fluttertoast.showToast( //buat nampilin nya coy
                      //   msg: "Register Success",
                      //   toastLength: Toast.LENGTH_SHORT, //ada long, ada short, umumnya yg dipake short
                      //   gravity: ToastGravity.BOTTOM,
                      //   backgroundColor: const Color.fromARGB(255, 198, 198, 198),
                      //   textColor: Colors.black,
                      // );
                     
                      Navigator.pushReplacement(  //klo push itu nimpa halaman nya (biasanya ga bawa data), klo replacement itu pindah page (sambil bawa data)
                        context, 
                        MaterialPageRoute(builder: (context) => const CatalogueScreen())
                      );
                    }
                  }, 
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.w600
                    ),
                  )
                ),
                
              
                //di toast ini per angka itu per second, klo semenit ya brarti 60, karna 60 detik
                const SizedBox(height: 10),
                TextButton(
                  onPressed : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> LoginScreen())
                    );
                  } , 
                  child: const Text("Already have an account? login here")
                ),

                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, //ni biar ke strech full gitu dia
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Register with Google",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),

                      const SizedBox(height: 16),

                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.black,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Register with Facebook",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
              ],
            )
          ),
        ),
      ),
    );
  }
}