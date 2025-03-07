import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {
  final Product product;

  //ini  callback untuk mengirim quantity ke add to cart

  const CartCounter({super.key, required this.product});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  //biar defaultnya jumlah item nya 1
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children:<Widget> [
        //logika untuk pengurangan
        OutlinedButton( 
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(25, 25),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
          
          ),
          child: const Icon(Icons.remove),
          onPressed: quantity > 1
          ? () {
            setState(() { 
              //ini bakal mengurangi kuantiti secara lokal, itu
              quantity--;
            });
            //buat ngirim quantity terbaru
            cartProvider.removeItems(widget.product.id.toString());
            //panggil widget dri si cartcounter
          }
          //ini null (gabisa nerima action) bakal mendisable tombol jika kuantitas <= 1
          : null
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: const TextStyle(fontSize: 18, color: textColor),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(25, 25),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              //untuk menambahkan kuantitas secara lokal/ cuma nambah angka doang, ga masuk ke keranjang
              quantity++; // ini syntax singkatnya, aslinya 'quantity = quantity + 1'
            });
            /* 
            -ini buat diambil, pendeklarasian informasi yg bakal dikirim ke addToCart (tombol keranjang)
            -starting point dmn quantitas bakal dibawa oleh tombol cart ke halaman cartScreen
            */
            cartProvider.addItems(
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image,
              1
              );
            // widget.onQuantityChanged(quantity);
          },
        )
      ],
    );
  }
}




















// import 'package:e_commerce/consts.dart';
// import 'package:e_commerce/state-management/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartCounter extends StatelessWidget {
//   final int itemId; //ini pastikan hrus int

//   const CartCounter({super.key, required this.itemId});

//   @override
//   Widget build(BuildContext context) {
//     //inisialisasi provider
//     final cartProvider = Provider.of<CartProvider>(context);

//     //ambil item dari provider berdasarkan id
//     final cartItem = cartProvider.items[itemId.toString()];


//     return Row(
//       children:<Widget>[
//         OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             minimumSize: const Size(35, 35),
//             padding: EdgeInsets.zero,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)
//             )
//           ),
//           onPressed: () {
//             //logic untuk button decrease
//             if (cartItem != null && cartItem.quantity > 0){
//               cartProvider.removeItems(itemId.toString());
//             }
//           },
//           child: const Icon(Icons.remove),
//         ),
//         const SizedBox(width: defaultPadding),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//           child: Text(
//             cartItem?.quantity.toString().padLeft(2, "0") ?? "00",
//             style: const TextStyle(fontSize: 18, color: textColor),
//           ),
//         )
//       ],
//     );
//   }
// }













// // import 'package:e_commerce/consts.dart';
// // import 'package:flutter/material.dart';

// // class CartCounter extends StatefulWidget {
// //   const CartCounter({super.key});

// //   @override
// //   State<CartCounter> createState() => _CartCounterState();
// // }

// // class _CartCounterState extends State<CartCounter> {
// //   int numOfItems = 1; // ini di atur satu karna minimal banget klo pas mau belanja tuh hrus ada satu item

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       children: <Widget>[   //ini best prektis ygy. <widget> ini buat memastikan/mendefinisikan/ngasih tau ini tuh isinya widget2
// //         OutlinedButton(
// //           style: OutlinedButton.styleFrom(
// //             minimumSize: const Size(45, 45),
// //             padding: EdgeInsets.zero,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(10)
// //             )
// //           ),
// //           onPressed: () { //ini logic klo button nya dipencet bakal ngelakuin apa
// //             setState(() { //setstate tuh buat memperbarui tampilan ui nya / perubahan widget
// //               if(numOfItems > 1) { //kalo numofItems nya lebih dri satu brarti kita bakal ngurangin satu.
// //                 setState(() {
// //                   numOfItems--; //ini woy yg ngurangin mah
// //                 });
// //               }
              
// //             });
// //           },
// //           child: const Icon(Icons.remove)
// //         ),
// //         const SizedBox(width: defaultPadding),
// //          Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
// //           child: Text(  
// //             numOfItems.toString().padLeft(2, '0'), //eh ini hasilnya bakal "0brp" //padleft yuh kek buat nambahin spasi gitu si, bisa atur jg mw nambahin karakter apa di space nya
// //             style: const TextStyle(                       //ini ngubah int ke string, karna teks gabisa int kann
// //               fontSize: 18,                         //yg sebelum2 nya kan bisa karna ngambil dri model, nah ini kan gaada di model, makanya diubah ke string
// //               color: textColor
// //             ),
// //           ),
// //         ),

// //         const SizedBox(width: defaultPadding),
// //         OutlinedButton(
// //           style: OutlinedButton.styleFrom(
// //             minimumSize: const Size(45, 45),
// //             padding: EdgeInsets.zero,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(10),
// //             )
// //           ),





// //           onPressed: () {
// //             setState(() {
// //               numOfItems++;
// //             });
// //           },
// //            child: const Icon(Icons.add)
// //         ),
// //       ],
// //     );
// //   }
// // }

// // //kadang gabisa manggil pas pake constant, karna const gabisa berubah