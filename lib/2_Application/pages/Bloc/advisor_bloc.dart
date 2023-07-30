import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'advisor_event.dart';
part 'advisor_state.dart';

class AdvisorBloc extends Bloc<AdvisorEvent, AdvisorState> {
  AdvisorBloc() : super(AdvisorInitial()) {
    on<ActiveRequestedEvent>((event, emit) async {
      emit(AdvisorLoading());
      // execute business logic
      // for example get and advice
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 3), () {});
      debugPrint('got advice');
      emit(AdvisorLoaded(advice: 'fake advice to test bloc'));
      emit(AdvisorError(message: 'error message'));
    });
  }
}
