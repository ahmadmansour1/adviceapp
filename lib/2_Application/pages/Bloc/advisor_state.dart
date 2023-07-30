part of 'advisor_bloc.dart';

@immutable
abstract class AdvisorState extends Equatable{

  List<Object?> get props => [];
}

class AdvisorInitial extends AdvisorState {


}
class AdvisorLoading extends AdvisorState{


}

class AdvisorLoaded extends AdvisorState {
  final String advice;
  AdvisorLoaded({required this.advice});

  @override

  List<Object?> get props => [advice];
  // compare if the advice is matching
}
class AdvisorError extends AdvisorState{
  final String message;
  AdvisorError({required this.message});

  @override

  List<Object?> get props => [message];
}

