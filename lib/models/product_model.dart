import 'package:dio/dio.dart';

// old model
class ProductModel{

  final String image;
  final String name;
  final double price;
  int cartCount = 1;
  bool inCart;
  bool isFav ;
  bool hasSale;

  ProductModel({required this.image, required this.name, required this.price, this.inCart = false, this.isFav = false, this.hasSale = false});

  static List <ProductModel> ProductList = [
    ProductModel(
      image: 'assets/images/flash_sale1.png',
      name: 'Product 1',
      price: 3499,
      hasSale: true,
      isFav: true,
      inCart:true,
    ),
    ProductModel(
      image: 'assets/images/flash_sale2.png',
      name: 'Product 2',
      price: 2499,
      hasSale: true,
      isFav: true,
      inCart:true,
    ),
    ProductModel(
      image: 'assets/images/flash_sale1.png',
      name: 'Product 3',
      price: 1499,
      hasSale: true,
      inCart:true,
    ),
    ProductModel(
      image: 'assets/images/flash_sale2.png',
      name: 'Product 4',
      price: 1199,
      hasSale: true,
        isFav: true
    ),
    ProductModel(
      image: 'assets/images/flash_sale1.png',
      name: 'Product 5',
      price: 6299,
      hasSale: true,
      isFav: true,
    ),
    ProductModel(
      image: 'assets/images/flash_sale2.png',
      name: 'Product 4',
      price: 1199,
      hasSale: true,
      isFav: true
    ),
  ];
}

//new model by API
class ProductModelB {
  bool status;
  dynamic message;
  Data data;

  ProductModelB({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductModelB.fromJson(Map<String, dynamic> json) => ProductModelB(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int currentPage;
  List<ProductItemB> productListB;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.productListB,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    productListB: List<ProductItemB>.from(json["data"].map((x) => ProductItemB.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(productListB.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class ProductItemB {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  ProductItemB({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductItemB.fromJson(Map<String, dynamic> json) => ProductItemB(
    id: json["id"],
    price: json["price"]?.toDouble(),
    oldPrice: json["old_price"]?.toDouble(),
    discount: json["discount"],
    image: json["image"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}

