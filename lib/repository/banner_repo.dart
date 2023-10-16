import 'package:dio/dio.dart';

import '../models/banner_model.dart';

class BannerRepo{

  final dio = Dio();

  Future<BannerModel> getBanners() async{
    final response = await dio.get('https://student.valuxapps.com/api/banners');
    BannerModel bannerModel = BannerModel.fromJson(response.data);
    return bannerModel;

  }
}