part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingAuthState extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthDataNotValid extends AuthState {

  final message;

  AuthDataNotValid(this.message);
}

class AuthFailedUnExpected extends AuthState {

  final message;

  AuthFailedUnExpected(this.message);
}
