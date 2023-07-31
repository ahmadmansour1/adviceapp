import 'dart:convert';

import 'package:adviceapp/0_data/Exeptions/exeptions.dart';

import '../Model/advice-model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  /// request an advice from api
  /// returns [AdviceModel] if succesful
  /// throw exeption if the status not 200
  Future<AdviceModel> getRandomeAdvive();
}

class GetAdviceRemoteDataSource implements AdviceRemoteDataSource {
  final http.Client client;
  GetAdviceRemoteDataSource({required this.client});
  @override
  Future<AdviceModel> getRandomeAdvive() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.de/api/v1/advice'),
      headers: {
        'content-type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw ServerExeption();
    } else {
      final responseBody = jsonDecode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
