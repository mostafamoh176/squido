import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/CustomColor.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.orange,
      ),
    );
  }
}
