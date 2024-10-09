import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1; // ini di atur satu karna minimal banget klo pas mau belanja tuh hrus ada satu item

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[   //ini best prektis ygy. <widget> ini buat memastikan/mendefinisikan/ngasih tau ini tuh isinya widget2
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(45, 45),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () { //ini logic klo button nya dipencet bakal ngelakuin apa
            setState(() { //setstate tuh buat memperbarui tampilan ui nya / perubahan widget
              if(numOfItems > 1) { //kalo numofItems nya lebih dri satu brarti kita bakal ngurangin satu.
                setState(() {
                  numOfItems--; //ini woy yg ngurangin mah
                });
              }
              
            });
          },
          child: const Icon(Icons.remove)
        ),
        const SizedBox(width: defaultPadding),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(  
            numOfItems.toString().padLeft(2, '0'), //eh ini hasilnya bakal "0brp" //padleft yuh kek buat nambahin spasi gitu si, bisa atur jg mw nambahin karakter apa di space nya
            style: const TextStyle(                       //ini ngubah int ke string, karna teks gabisa int kann
              fontSize: 18,                         //yg sebelum2 nya kan bisa karna ngambil dri model, nah ini kan gaada di model, makanya diubah ke string
              color: textColor
            ),
          ),
        ),

        const SizedBox(width: defaultPadding),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(45, 45),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          },
           child: const Icon(Icons.add)
        ),
      ],
    );
  }
}

//kadang gabisa manggil pas pake constant, karna const gabisa berubah