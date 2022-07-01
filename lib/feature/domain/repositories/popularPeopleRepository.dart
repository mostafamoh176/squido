import 'package:dartz/dartz.dart';
import 'package:squadiotask/core/errors/failures.dart';
import 'package:squadiotask/feature/domain/entites/popularPeople.dart';

abstract class PopularPeopleRepository{
  Future<Either<Failures,List<PopularPeople>>> getPopularPropleResults();
}
