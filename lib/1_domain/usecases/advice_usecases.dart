import 'package:adviceapp/1_domain/entity/Entity.dart';
import 'package:adviceapp/1_domain/failure/failure.dart';
import 'package:dartz/dartz.dart';
//Either comme from package dartz its provide a functional programming
// function can return 2 types
class AdviceUsecases {
  Future<Either<Failure ,Entity>> getAdvices() async{
    await Future.delayed(const Duration(seconds: 3), () {});
    // return   right(const Entity(advice: 'advice to test', id: 1));

    return left( ServerFailure());

  }

}