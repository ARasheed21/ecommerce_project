import 'package:dio/dio.dart';

import '../models/product_model.dart';

class ProductRepo{

  final dio = Dio();

  Future<ProductModelB> getProducts() async{
    final response = await dio.get('https://student.valuxapps.com/api/products');

    ProductModelB productModelB = ProductModelB.fromJson(response.data);
    return productModelB;

  }
}