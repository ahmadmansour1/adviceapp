import 'package:adviceapp/0_data/repositories/advice_repo_impl.dart';
import 'package:adviceapp/1_domain/entity/Entity.dart';
import 'package:adviceapp/1_domain/failure/failure.dart';
import 'package:adviceapp/1_domain/repository/advice_repo.dart';
import 'package:dartz/dartz.dart';
//Either comme from package dartz its provide a functional programming
// function can return 2 types
class AdviceUsecases {
  final adviceRepo = RepooImpl();
  Future<Either<Failure ,Entity>> getAdvices() async{
  return adviceRepo.getAdviceFromDataSource();

  }

}