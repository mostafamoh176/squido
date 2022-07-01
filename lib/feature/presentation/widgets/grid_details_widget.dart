import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadiotask/feature/presentation/widgets/widget_of_gridView.dart';

import '../../data/models/popuar_model.dart';
import '../../domain/entites/popularPeople.dart';
import '../views/details_image_screen.dart';

Widget gridDetailsWidget({required List popularPeople}) {
  return Container(
    height: 400,
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3.2,
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0),
      itemCount: popularPeople.length,
      itemBuilder: (BuildContext context, int index) {
        return CardDetailsWidget(
          img: popularPeople[index].posterPath.toString(),
          txt: popularPeople[index].title.toString() == "null"
              ? popularPeople[index].name.toString()
              : popularPeople[index].title.toString(),
          context: context,
          index: index,
          height: 400.h,
        );
      },
    ),
  );
}

Widget CardDetailsWidget(
    {required String img,
    required String txt,
    required BuildContext context,
    required index,
    required double height}) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DetilsImagesScreen(img: img)));
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
