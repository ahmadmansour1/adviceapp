import 'package:dartz/dartz.dart';

import '../entity/Entity.dart';
import '../failure/failure.dart';

abstract class AdviceRepo  {
  Future<Either<Failure ,Entity>>getAdviceFromDataSource();
}