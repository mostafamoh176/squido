import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadiotask/core/widgets/loadingWidget.dart';
import 'package:squadiotask/feature/presentation/widgets/widget_of_gridView.dart';

import '../people_business_logic/popular_people_bloc.dart';
import '../widgets/widget_of_error.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

 Widget _bodyMainScreen() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<PopularPeopleBloc, PopularPeopleState>(
        builder: (context, state) {
          if (state is LoadingPeoplePopularState) {
            return LoadingWidget();
          }
          if (state is SuccessPeoplePopularState) {
            return GridViewWidget(popularPeople: state.popularData);
          }
          if (state is ErrorPeoplePopularState) {
            return MessageErrorWidget(
              msg: '${state.msg.toString()}',
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Popular People"),
      ),
      body: _bodyMainScreen(),
    );
  }
}
