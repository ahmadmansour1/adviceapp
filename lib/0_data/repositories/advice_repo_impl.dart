import 'package:adviceapp/0_data/datasource/advice_remote_datasouce.dart';
import 'package:adviceapp/1_domain/entity/Entity.dart';
import 'package:adviceapp/1_domain/failure/failure.dart';
import 'package:adviceapp/1_domain/repository/advice_repo.dart';
import 'package:dartz/dartz.dart';

import '../Exeptions/exeptions.dart';

class RepooImpl implements AdviceRepo {
  final GetAdviceRemoteDataSource adviceRemoteDataSource;

  RepooImpl({required this.adviceRemoteDataSource});
  @override
  Future<Either<Failure, Entity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDataSource.getRandomeAdvive();
      return right(result);
    } on ServerExeption catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
