import 'package:dartz/dartz.dart';
import 'package:squadiotask/core/errors/failures.dart';
import 'package:squadiotask/feature/domain/entites/popularPeople.dart';
import 'package:squadiotask/feature/domain/repositories/popularPeopleRepository.dart';

import '../../../core/errors/exception.dart';
import '../../../core/network/network_info.dart';
import '../dataSources/popular_local_data_source.dart';
import '../dataSources/popular_remote_data_source.dart';
import '../models/popuar_model.dart';

class PopularPeopleRepositoryImp implements PopularPeopleRepository {
  final PopularRemoteDataSrc remoteDataSrc;
  final PopularLocalDataSource localDataSrc;
  final NetworkInfo networkInfo;

  PopularPeopleRepositoryImp({
    required this.remoteDataSrc,
    required this.localDataSrc,
    required this.networkInfo,
  });

  @override
  Future<Either<Failures, List<ResultsDataModel>>>
      getPopularPropleResults() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePopular = await remoteDataSrc.getAllPopularPeople();
        localDataSrc.CashedPopularData(remotePopular);
        return Right(remotePopular);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPopular = await localDataSrc.getCashedPopularData();
        return Right(localPopular);
      } on EmptyCashException {
        return Left(EmptyCashFailure());
      }
    }
    throw UnimplementedError();
  }
}
