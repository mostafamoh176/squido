import 'dart:convert';

import 'package:squadiotask/feature/data/models/popuar_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/errors/exception.dart';
import '../../../core/shared/constant.dart';

abstract class PopularRemoteDataSrc {
  Future<List<ResultsDataModel>> getAllPopularPeople();
}

class PopularRemoteDataSrcImp implements PopularRemoteDataSrc {
  final http.Client client;

  PopularRemoteDataSrcImp({required this.client});

  @override
  Future<List<ResultsDataModel>> getAllPopularPeople() async {
    final response = await client.get(
      Uri.parse(CommonUse.BASE_URL),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> decodedJson = map["results"];
      List<ResultsDataModel> popularModel = decodedJson
          .map<ResultsDataModel>((jsonPopularModel) =>
          ResultsDataModel.fromJson(jsonPopularModel))
          .toList();
      return popularModel;
    } else {
      throw ServerException();
    }
  }
}
