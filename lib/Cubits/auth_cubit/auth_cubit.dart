import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:first_project/repository/user_repo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final UserRepo userRepo = UserRepo();

  void register(String name, String phone, String email, String pass) async {
    emit(LoadingAuthState());
    final response = await userRepo.registerNewUser(
      name,
      phone,
      email,
      pass,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try{
      if(response.data['status'] == true){
        await prefs.setString('access-token', response.data['token'] ?? '');
        emit(AuthSuccess());
      }else{
        emit(AuthDataNotValid(response.data['message']));
      }
    } on SocketException catch (e){
      emit(AuthFailedUnExpected(e.message));
    }on Exception catch (e){
      emit(AuthFailedUnExpected(e.toString()));
    }catch (e){
      emit(AuthFailedUnExpected(e.toString()));
    }

    print(response);

  }
}
