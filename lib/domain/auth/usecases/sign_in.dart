import 'package:dartz/dartz.dart';
import 'package:netflix_app/core/usecase/usecase.dart';
import 'package:netflix_app/data/auth/models/signin_req_params.dart';
import 'package:netflix_app/domain/auth/repositories/auth.dart';
import 'package:netflix_app/service_locator.dart';


class SignInUseCase extends UseCase<Either, SignInReqParams>{
  @override
  Future<Either> call({SignInReqParams? params}) async {
    return await sl<AuthRepository>().signIn(params!);
  }


}