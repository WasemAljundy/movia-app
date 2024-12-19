import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {

  Future<Either> signUp(SignupReqParams params);
  Future<Either> signIn(SignInReqParams params);
  Future<bool> isLoggedIn();
}