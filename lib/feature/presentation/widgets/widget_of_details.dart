import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadiotask/feature/presentation/widgets/widget_of_gridView.dart';

import '../../data/models/popuar_model.dart';
import 'grid_details_widget.dart';

class DetailsWidget extends StatelessWidget {
  final List<ResultsDataModel> popularPeople;
  int index;

  DetailsWidget({super.key, required this.popularPeople, required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          detailsPerson(
            img: popularPeople[index].profilePath.toString(),
            name: popularPeople[index].name.toString(),
            work: popularPeople[index].knownForDepartment.toString(),
            popularity: popularPeople[index].popularity.toString(),
          ),
          gridDetailsWidget(
            popularPeople:popularPeople[index].knownF!,
          ),
        ],
      ),
    );
  }
}

Widget detailsPerson({
  required String img,
  required String name,
  required String work,
  required String popularity,
}) {
  return Container(
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              fit: BoxFit.cover,
              "https://image.tmdb.org/t/p/original$img",
              height: 400.h,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: $name",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Known As: $work",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "popularity: $popularity",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ))
      ],
    ),
  );
}
