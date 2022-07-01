part of 'popular_people_bloc.dart';

@immutable
abstract class PopularPeopleEvent {}
class GetAllPopularPeopleEvent extends PopularPeopleEvent{}
class RefreshPopularPeopleEvent extends PopularPeopleEvent{}
