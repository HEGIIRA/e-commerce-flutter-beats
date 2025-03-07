import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity; //ini ga final, karna dia ga wajib

  //ini buat nyimpe data apa aja yg bakal kita ambil dri catalog ke keranjang
  CartItem({
    required this.id, 
    required this.title, 
    required this.price,
    required this.image,
    this.quantity = 1, //ini ga wajib tpi default nya 1 walaupun ga di trigger
  });
}

//NAH NAON IEU?? bedanya extend ama with?
//with tuh buat pke fitu2 tertentu
//extend tuh pewarissan, jdi sungsi/fitur utama nya bakal terwariskan atau kepake
//mixin ama mixins apalagi cba? ini buat klo kita mw nerapin sebuah FP (Functional Programming)

//buat tau apa perbedaan antara OOP dan FP
class CartProvider with ChangeNotifier {
  //1 setter bisa dibuat beberapa getter
  final Map<String, CartItem> _items = {};

  //getter 1
  Map<String, CartItem> get items => _items;


  //getter 2
  //ni beda nih, fungsianya ngehandle perhitungan jumlah total harga yang ada di cart
  int get totalPrice {
    return _items.values.fold( //syntax klo mau nge oprasiin matematika
      //initial status sebelum operasi matematika dilakukan
      0, //ini nilai default
      //sum = pertambahan, sum itu aslinya 0 buat nandain adanya proses perhitungan (bisa aja pke variable lain kyk 'number' yg penting buat nandain aritmatika aja), item bikin sendiri
      (sum, item) => sum + item.price * item.quantity //sum klo di excel buat nambahin column
    );
  }

  //ini buat nambah
  void addItems(String id, String title , int price, String image, int quantity) {
    //nambahin item ke keranjang sesuai cart counter
    if (_items.containsKey(id)) {
      // += ini maksudnya plus/ nambahin 1, klo udh masuk cart, trus balik lgi ke detail screen awal dan nambahin 1/2 lagi, jdi state yg sebelumnya tetep ada dan nambah sesuai yg kita tambah di detail screen
      _items[id]!.quantity += quantity; //ini kan pke (!.) nah knp ga pake (?) karna ini ga yakin kan, dia masih nanya, klo pke bang itu lbih ke ngasih tau klo ini tuh aman loh, kita udh punya value 1.
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: quantity );

    }
    notifyListeners();
  } 

  //ini buat ngehapus
  void removeItems(String id) {
    //INI CARA 1
    _items.remove(id);
    notifyListeners();

    // INI CARA 2
    // if (_items.containsKey(id)) {
    //   //kurangi kuantitas item
    //   _items[id]!.quantity--;

    //   //ini kan if lagi, buakn else, itu namanya nested if. dua kondisi 'JIKA'

    //   //klo item nya 0 di keranjang nnti di remove dri keranjang
    //   //ini buat klo dihapus dri cart dia ngehapus semua-muanya, (cache nya)
    //   if (_items[id]!.quantity <= 0) {
    //     _items.remove(id);
    //   }
    // }
    // notifyListeners();
  }
}

//klo bang operator trus after nya titik (!.) itu buat null safety, klo bang nya di awal itu buat note