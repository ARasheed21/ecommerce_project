import 'package:dio/dio.dart';
class BannerModel {
  bool status;
  dynamic message;
  List<BannerItem> bannersList;
  //static List <int> listForCarouselIndicator = bannersList.map((e) => e.id).toList();

  BannerModel({
    required this.status,
    required this.message,
    required this.bannersList,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    status: json["status"],
    message: json["message"],
    bannersList: List<BannerItem>.from(json["data"].map((x) => BannerItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(bannersList.map((x) => x.toJson())),
  };
}

class BannerItem {
  int id;
  String image;
  dynamic category;
  dynamic product;

  BannerItem({
    required this.id,
    required this.image,
    required this.category,
    required this.product,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category,
    "product": product,
  };
}




