import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:squadiotask/feature/presentation/views/details_screen_view.dart';

class DetilsImagesScreen extends StatelessWidget {
  String img;

  DetilsImagesScreen({required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: Container(
        child: InkWell(
          onTap: () async {
            final tempDir = await getTemporaryDirectory();
            final path = "${tempDir.path}/myfile.jpg";
            await Dio()
                .download("https://image.tmdb.org/t/p/original$img", path);

            await GallerySaver.saveImage(path);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Downloaded to Gallery",style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
            ));
          },
          child: Image(
            image: NetworkImage(
              "https://image.tmdb.org/t/p/original$img",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
