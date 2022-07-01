import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadiotask/core/network/network_info.dart';
import 'package:squadiotask/feature/data/dataSources/popular_local_data_source.dart';
import 'package:squadiotask/feature/data/dataSources/popular_remote_data_source.dart';
import 'package:squadiotask/feature/data/repositories/popular_repository_ipm.dart';
import 'package:squadiotask/feature/domain/useCases/get_all_popular_people.dart';
import 'package:squadiotask/feature/presentation/reservation_business_logic/popular_people_bloc.dart';

import '../core/shared/constant.dart';
import '../feature/presentation/views/mainScreen.dart';

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PopularPeopleBloc(
            getAllPopularPeopleUserCases: GetAllPopularPeopleUserCases(
              PopularPeopleRepositoryImp(
                localDataSrc: PopularLocalDataSrcImp(
                    sharedPreferences: sharedPreferences),
                remoteDataSrc: PopularRemoteDataSrcImp(client: Client()),
                networkInfo: NetworkInfoImp(InternetConnectionChecker()),
              ),
            ),
          ),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: const Size(DifferenSize.appWidth, DifferenSize.appHeight),
          builder: (BuildContext context, Widget? child) => MainScreen(),
        ),
      ),
    );
  }
}
