import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/injection/injection_container.dart' as di;
import '../core/shared/constant.dart';
import '../feature/presentation/people_business_logic/popular_people_bloc.dart';
import '../feature/presentation/views/mainScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di.sl<PopularPeopleBloc>()..add(GetAllPopularPeopleEvent()),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize:  Size(DifferenSize.appWidth, DifferenSize.appHeight),
          builder: (BuildContext context, Widget? child) => MainScreen(),
        ),
      ),
    );
  }
}
