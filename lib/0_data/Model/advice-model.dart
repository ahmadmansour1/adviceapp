import 'package:adviceapp/1_domain/entity/Entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends Entity with EquatableMixin {

  AdviceModel( {required String advice, required int id}) : super(advice:advice , id: id );

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json['advice'], id: json['id'] ?? 0 );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['advice_id'] = this.adviceId;
  //   data['advice'] = this.advice;
  //   return data;
  // }
}