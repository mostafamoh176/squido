import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../data/models/popuar_model.dart';
import '../entites/popularPeople.dart';
import '../repositories/popularPeopleRepository.dart';

class GetAllPopularPeopleUserCases {
  final PopularPeopleRepository popularPeopleRepository;

  GetAllPopularPeopleUserCases(this.popularPeopleRepository);

  Future<Either<Failures, List<ResultsDataModel>>> call() async {
    return await popularPeopleRepository.getPopularPropleResults();
  }
}
