
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadiotask/feature/domain/repositories/popularPeopleRepository.dart';

import '../../feature/data/dataSources/popular_local_data_source.dart';
import '../../feature/data/dataSources/popular_remote_data_source.dart';
import '../../feature/data/repositories/popular_repository_ipm.dart';
import '../../feature/domain/useCases/get_all_popular_people.dart';
import '../../feature/presentation/people_business_logic/popular_people_bloc.dart';
import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(
      () => PopularPeopleBloc(getAllPopularPeopleUserCases: sl()));
  //use cases
  sl.registerLazySingleton(() => GetAllPopularPeopleUserCases(sl()));
  //repository
  sl.registerLazySingleton<PopularPeopleRepository>(
    () => PopularPeopleRepositoryImp(
      localDataSrc: sl(),
      networkInfo: sl(),
      remoteDataSrc: sl(),
    ),
  );
  // Datasources

  sl.registerLazySingleton<PopularLocalDataSource>(() => PopularLocalDataSrcImp(sharedPreferences: sl()));
  sl.registerLazySingleton<PopularRemoteDataSrc>(() => PopularRemoteDataSrcImp(client: sl()));
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImp(sl()));
  final sharedPref=await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPref);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());


}
