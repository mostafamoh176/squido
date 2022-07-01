import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadiotask/feature/domain/entites/popularPeople.dart';

import '../../data/models/popuar_model.dart';
import '../views/details_screen_view.dart';

class GridViewWidget extends StatelessWidget {
  final List<ResultsDataModel> popularPeople;

  const GridViewWidget({super.key, required this.popularPeople});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3.2,
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0),
      itemCount: popularPeople.length,
      itemBuilder: (BuildContext context, int index) {
        return CardWidget(
          img: popularPeople[index].profilePath.toString(),
          txt: popularPeople[index].name.toString(),
          context: context,
          index: index,
          height: 800.h,
        );
      },
    );
  }
}

Widget CardWidget(
    {required String img,
    required String txt,
    required BuildContext context,
    required index,
    required double height}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DetailsScreen(
                index: index,
              )));
    },
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              fit: BoxFit.cover,
              "https://image.tmdb.org/t/p/original$img",
              height: height,
            ),
          ),
          Text(
            "$txt",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange),
          )
        ],
      ),
    ),
  );
}
