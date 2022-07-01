import 'package:dartz/dartz.dart';
import 'package:squadiotask/core/errors/failures.dart';

import '../../data/models/popuar_model.dart';

abstract class PopularPeopleRepository{
  Future<Either<Failures,List<ResultsDataModel>>> getPopularPropleResults();
}
