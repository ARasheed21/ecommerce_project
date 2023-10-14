import 'package:dio/dio.dart';
import 'package:first_project/models/catogery_model.dart';

final dio = Dio();

void getHTTP() async{
  final response = await dio.get('https://student.valuxapps.com/api/banners');

}

// class CategoriesModel {
//   bool status;
//   dynamic message;
//   List<categoryItem> categoriesList; // known as "data" in the api
//
//   CategoriesModel({
//     required this.status,
//     required this.message,
//     required this.categoriesList,
//   });
//
//   factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
//     status: json["status"],
//     message: json["message"],
//     categoriesList: List<categoryItem>.from(json["data"].map((x) => categoryItem.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": List<dynamic>.from(categoriesList.map((x) => x.toJson())),
//   };
// }
//
// class categoryItem {
//   int id;
//   String image;
//   dynamic category;
//   dynamic product;
//
//   categoryItem({
//     required this.id,
//     required this.image,
//     required this.category,
//     required this.product,
//   });
//
//   factory categoryItem.fromJson(Map<String, dynamic> json) => categoryItem(
//     id: json["id"],
//     image: json["image"],
//     category: json["category"],
//     product: json["product"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "image": image,
//     "category": category,
//     "product": product,
//   };
// }
