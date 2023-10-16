import 'package:dio/dio.dart';

import '../models/catogery_model.dart';

class CategoryRepo{

  final dio = Dio();

  Future<CategoriesModel> getCategories() async{
    final response = await dio.get('https://student.valuxapps.com/api/categories');

    CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);
    return categoriesModel;
  }
}