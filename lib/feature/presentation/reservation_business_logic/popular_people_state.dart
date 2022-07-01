
part of 'popular_people_bloc.dart';

@immutable
abstract class PopularPeopleState extends Equatable {}

class PopularPeopleInitial extends PopularPeopleState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingPeoplePopularState extends PopularPeopleState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class SuccessPeoplePopularState extends PopularPeopleState {
  final List<PopularPeople> popularData;

  SuccessPeoplePopularState(this.popularData);

  @override
  List<Object?> get props => [popularData];
}
class ErrorPeoplePopularState extends PopularPeopleState {
  final String msg;

  ErrorPeoplePopularState({required this.msg});


  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
