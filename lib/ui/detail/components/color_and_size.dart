import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded( //buat ngisi kekosongan yg ada
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker( 
                    color: Color(0xFF3D82AE),
                    isSelected: true,   //state user tuh dah milih warna apa blom
                  ),
                  ColorPicker( 
                    color: Color(0xFFF8C078),
                    isSelected: true,   //state user tuh dah milih warna apa blom
                  ),
                  ColorPicker( 
                    color: Color(0xFF989493),
                    isSelected: true,   //state dimana user tuh dah milih warna apa blom
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          //cara lain buat nampilin dan modif si text nya
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size",
                style: TextStyle(color: textColor),
              ),
              RichText(
                text: TextSpan( //textspan tuh lebih complex
                style: const TextStyle(color: textColor), //klo argue nya satu mending inline (hrus deng, biar g bingung)
                children: [
                  TextSpan( //ini cara nampilin text tpi di styling pke textspan
                    text: "${product.size} cm",
                    style: Theme.of(context)
                    //ini manggil method klo pke titik gini tuuh
                    .textTheme //ini method biar warna teks nya tuh kontras sama card atau bg aplikasi kita (Tema gelap, tema terang)
                                //gausah pke logic, dia auto bakal nyesuain warna sma bg nya gituloo
                    .titleLarge! //ini tuh buat nge bold si headline biar lebih gede dri si title size
                    .copyWith(fontWeight: FontWeight.bold)
                    )
                  ],
                )
              )
            ],
          )
        )
      ],
    );
  }
}

//bedanya text sma text span = 
//sama2 untuk styling teks, klo text itu superclass
//klo textspan itu subclass dri richtext
//rich text itu 

//intent tuh di andro, klo di flutter tuh navigation
//explicit -> langsung, dia pindah halaman tpi ga bawa apa-apa(data y gasi)
//implicit -> bawa data, dia pindah halaman ke detai tpi bawa data (id, text, dll)
//implicit ngambil data, gamungkin kan pas di pencet kotak yg mana, yg muncul malah detail yg mana, udh pasti hrus sama
class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  //ini pas mw buat logic si color picker
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ),
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      //modifikasi untuk border dri color picker nya
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent //ini logic biar warna yg ke pick tuh ada border nya

        )   
      ),

      child: DecoratedBox( //pke decoratedbox biar bisa pake sub class yg ada di boxdecoration, biar variatif lgi
        //modifikasi untuk colorpicker nya
        decoration: BoxDecoration( //bedanya klo decoratedbox bisa manggil widget
          color: color,
          shape: BoxShape.circle
        )
      ),
    );
  }
}
 //edgeinsets vertycal bikin jarak vertikal/horixontal
 //klo yg only itu bisa nentuin jaraknya tuh mau top, left, bot, atau semua