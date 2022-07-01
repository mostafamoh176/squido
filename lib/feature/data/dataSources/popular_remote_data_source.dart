import 'dart:convert';

import 'package:squadiotask/feature/data/models/popuar_model.dart';
import 'package:http/http.dart' as http;

import '../../../core/errors/exception.dart';
import '../../../core/shared/constant.dart';

abstract class PopularRemoteDataSrc {
  Future<List<PopularPeopleModel>> getAllPopularPeople();
}

class PopularRemoteDataSrcImp implements PopularRemoteDataSrc {
  final http.Client client;

  PopularRemoteDataSrcImp({required this.client});

  @override
  Future<List<PopularPeopleModel>> getAllPopularPeople() async {
    final response = await client.get(
      Uri.parse(CommonUse.BASE_URL),
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      List<PopularPeopleModel> popularModel = decodedJson
          .map<PopularPeopleModel>((jsonPopularModel) =>
              PopularPeopleModel.fromJson(jsonPopularModel))
          .toList();
      return popularModel;
    } else {
      throw ServerException();
    }
  }
}
