import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:squadiotask/core/errors/failures.dart';
import 'package:squadiotask/feature/domain/entites/popularPeople.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/shared/constant.dart';
import '../../data/models/popuar_model.dart';
import '../../domain/useCases/get_all_popular_people.dart';

part 'popular_people_event.dart';

part 'popular_people_state.dart';

class PopularPeopleBloc extends Bloc<PopularPeopleEvent, PopularPeopleState> {
  final GetAllPopularPeopleUserCases getAllPopularPeopleUserCases;

  PopularPeopleBloc({required this.getAllPopularPeopleUserCases})
      : super(PopularPeopleInitial()) {
    on<PopularPeopleEvent>((event, emit) async {
      if (event is GetAllPopularPeopleEvent) {
        emit(LoadingPeoplePopularState());
        final popular = await getAllPopularPeopleUserCases();
        emit(_mapFailureOrPeopleToState(popular));
      } else if (event is RefreshPopularPeopleEvent) {
        emit(LoadingPeoplePopularState());
        final popular = await getAllPopularPeopleUserCases();
        emit(_mapFailureOrPeopleToState(popular));
      }
    });
  }

  PopularPeopleState _mapFailureOrPeopleToState(
      Either<Failures, List<ResultsDataModel>> either) {
    return either.fold(
        (failure) => ErrorPeoplePopularState(msg: _failureToMessage(failure)),
        (popular) => SuccessPeoplePopularState(popular));
  }

  String _failureToMessage(Failures failures) {
    switch (failures.runtimeType) {
      case ServerFailure:
        return CommonUse.failureServer;
      case EmptyCashFailure:
        return CommonUse.EmptyCashMsg;
      case OfflineFailure:
        return CommonUse.OfflineFailureMsg;
      default:
        return CommonUse.defaultFailureMsg;
    }
  }
}
