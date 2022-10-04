class CartModel {
  int? id;
  String? title;
  String? imgUrl;
  double? price;
  double? totalPrice;
  int? qty;

  CartModel({
    this.id,
    this.title,
    this.price,
    this.totalPrice,
    this.qty,
    this.imgUrl,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      totalPrice: json['totalPrice'],
      qty: json['qty'],
      imgUrl: json['imgUrl'],
    );
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['title'] = this.title;
    map['price'] = this.price;
    map['totalPrice'] = this.totalPrice;
    map['qty'] = this.qty;
    map['imgUrl'] = this.imgUrl;

    return map;
  }
}

class ProductModel {
  int? id;
  String? title;
  String? imgUrl;
  double? price;
  int? qty;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.qty,
    this.imgUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      qty: json['qty'],
      imgUrl: json['imgUrl'],
    );
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = this.id;
    map['title'] = this.title;
    map['price'] = this.price;
    map['qty'] = this.qty;
    map['imgUrl'] = this.imgUrl;

    return map;
  }
}

class FetchProduct {
  static final List<ProductModel> productList = [
    ProductModel(
        id: 1,
        title: 'Xiaomi Redmi Note 9 Pro || 8GB RAM || 128GB',
        price: 323,
        qty: 1,
        imgUrl:
            'https://fdn2.gsmarena.com/vv/bigpic/xiaomi-redmi-note-9-pro-global-.jpg'),
    ProductModel(
        id: 2,
        title: 'Infinix Note 12 VIP || 8GB RAM || 128GB',
        price: 323,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Infinix/InfinixNote12VIP-b.jpg'),
    ProductModel(
        id: 3,
        title: 'Xiaomi 12 Pro || 8GB RAM || 128GB',
        price: 1039,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Xiaomi/Xiaomi12Pro-b.jpg'),
    ProductModel(
        id: 4,
        title: 'Samsung Galaxy S21 || 8GB RAM || 128GB',
        price: 1315,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Samsung/SamsungGalaxyS21-b.jpg'),
    ProductModel(
        id: 5,
        title: 'Vivo Y17 || 8GB RAM || 128GB',
        price: 253,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Vivo/VivoY17-b.jpg'),
    ProductModel(
        id: 6,
        title: 'Samsung Galaxy A32 || 8GB RAM || 128GB',
        price: 253,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Samsung/SamsungGalaxyA32-b.jpg'),
    ProductModel(
        id: 7,
        title: 'Vivo Y53s || 8GB RAM || 128GB',
        price: 204,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Vivo/VivoY53s-b.jpg'),
    ProductModel(
        id: 8,
        title: 'Oppo Reno 6 || 8GB RAM || 128GB',
        price: 323,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Oppo/OppoReno6-b.jpg'),
    ProductModel(
        id: 9,
        title: 'Tecno Spark 8 Pro || 8GB RAM || 128GB',
        price: 124,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Tecno/TecnoSpark8Pro-b.jpg'),
    ProductModel(
        id: 10,
        title: 'Infinix Zero X Pro|| 8GB RAM || 128GB',
        price: 248,
        qty: 1,
        imgUrl:
            'https://www.whatmobile.com.pk/admin/images/Infinix/InfinixZeroXPro-b.jpg'),
  ];
}
