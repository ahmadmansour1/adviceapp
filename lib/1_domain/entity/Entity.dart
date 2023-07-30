import 'package:equatable/equatable.dart';

class Entity extends Equatable {
  @override
  List<Object?> get props => [advice , id];
 final String advice;
 final int id ;
 const Entity({required this.advice , required this.id});

}