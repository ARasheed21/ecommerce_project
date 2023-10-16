import 'package:dio/dio.dart';

import '../models/catogery_model.dart';
import '../models/product_model.dart';

class CategoryProductRepo{

  final dio = Dio();

  Future<ProductModelB> getCategoryProducts(int id) async{
    final response = await dio.get('https://student.valuxapps.com/api/products?category_id=$id');

    ProductModelB productModelB = ProductModelB.fromJson(response.data);
    return productModelB;
  }
}