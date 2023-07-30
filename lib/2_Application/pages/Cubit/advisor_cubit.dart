import 'package:adviceapp/1_domain/entity/Entity.dart';
import 'package:adviceapp/1_domain/usecases/advice_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../1_domain/failure/failure.dart';

part 'advisor_state.dart';

class AdvisorCubit extends Cubit<AdvisorCubitState> {
  AdvisorCubit() : super(AdvisorInitial());
  final AdviceUsecases usecasses = AdviceUsecases();
  void getAdvice() async {
    emit(AdvisorLoading());
    final failureOrAdvice =await usecasses.getAdvices();
    failureOrAdvice.fold(
            (failure) => emit(AdvisorError(message: _mapFaailureOnMessage(failure))),
            (advice) => emit(AdvisorLoaded(advice: advice.advice)),);
    // execute business logic
    // for example get and advice


    //
  }
  //define the strings in a const variable
  String _mapFaailureOnMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return 'something went wrong with the api';

      case CacheFailure:
        return 'upps , check failed';

      default:
        return 'opps something went wrong ';
    }



  }
}
