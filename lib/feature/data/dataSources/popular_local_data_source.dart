import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadiotask/core/errors/exception.dart';
import 'package:squadiotask/feature/data/models/popuar_model.dart';

import '../../../core/shared/constant.dart';

abstract class PopularLocalDataSource {
  Future<List<ResultsDataModel>> getCashedPopularData();

  Future<Unit> CashedPopularData(List<ResultsDataModel> popularModels);
}

class PopularLocalDataSrcImp extends PopularLocalDataSource {
  final SharedPreferences sharedPreferences;

  PopularLocalDataSrcImp({required this.sharedPreferences});

  @override
  Future<Unit> CashedPopularData(List<ResultsDataModel> popularModels) {
    List popularModelsToJson = popularModels
        .map<Map<String, dynamic>>((popularModels) => popularModels.toJson())
        .toList();
    sharedPreferences.setString(
        CommonUse.CASHEDNETWORK, json.encode(popularModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<ResultsDataModel>> getCashedPopularData() {
    final jsonString = sharedPreferences.getString(CommonUse.CASHEDNETWORK);
    if (jsonString != null) {
      List decodedJsonData = json.decode(jsonString);
      List<ResultsDataModel> jsonToPopularModels = decodedJsonData
          .map<ResultsDataModel>((jsonPopularModel) =>
          ResultsDataModel.fromJson(jsonPopularModel))
          .toList();
      return Future.value(jsonToPopularModels);
    } else {
      throw EmptyCashException();
    }
  }
}
