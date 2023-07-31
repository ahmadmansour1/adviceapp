import 'package:adviceapp/0_data/datasource/advice_remote_datasouce.dart';
import 'package:adviceapp/0_data/repositories/advice_repo_impl.dart';
import 'package:adviceapp/1_domain/usecases/advice_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '2_Application/pages/Cubit/advisor_cubit.dart';

final sl = GetIt.I; //sl = server locator
Future <void> init() async {
  sl.registerFactory(() => AdvisorCubit(usecasses: sl()));
  //Application Layer
  //A factory means that every time you request an instance of AdvisorCubit,
  // it will create a new instance for you. and same for all instance
  sl.registerFactory(() => AdviceUsecases(adviceRepo: sl()));
  //domain layer
  sl.registerFactory(() => RepooImpl(adviceRemoteDataSource: sl()));
  //data layer

  sl.registerFactory(() => GetAdviceRemoteDataSource(client: sl()));

  sl.registerFactory(() => http.Client());
}