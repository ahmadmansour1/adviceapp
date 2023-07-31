part of 'advisor_cubit.dart';

@immutable
abstract class AdvisorCubitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdvisorInitial extends AdvisorCubitState {

}

class AdvisorLoading extends AdvisorCubitState{}

class AdvisorLoaded extends AdvisorCubitState {
  final String advice;
  AdvisorLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
// compare if the advice is matching
}
class AdvisorError extends AdvisorCubitState{
  final String message;
  AdvisorError({required this.message});

  @override
  List<Object?> get props => [message];
}