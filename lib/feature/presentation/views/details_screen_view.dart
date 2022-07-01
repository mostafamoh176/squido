import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadiotask/feature/presentation/people_business_logic/popular_people_bloc.dart';

import '../../../core/widgets/loadingWidget.dart';
import '../widgets/widget_of_details.dart';
import '../widgets/widget_of_error.dart';

class DetailsScreen extends StatelessWidget {
  int index;

  DetailsScreen({required this.index});

  _bodyWidget() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: BlocBuilder<PopularPeopleBloc, PopularPeopleState>(
        builder: (context, state) {
          if (state is LoadingPeoplePopularState) {
            return LoadingWidget();
          }
          if (state is SuccessPeoplePopularState) {
            return DetailsWidget(
              popularPeople: state.popularData,
              index: index,
            );
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
        elevation: 0,
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: _bodyWidget(),
    );
  }
}
