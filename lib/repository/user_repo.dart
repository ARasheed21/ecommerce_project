import 'package:dio/dio.dart';

class UserRepo {
  final dio = Dio();

  Future<Response> registerNewUser(String name, String phone, String email, String pass) async {
    final response = await dio.post(
      'https://student.valuxapps.com/api/register',
      data: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": pass,
        "image":"",
      },
    );

    return response;
  }
}
