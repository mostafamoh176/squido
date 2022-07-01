import 'package:flutter/material.dart';

class MessageErrorWidget extends StatelessWidget {
  final String msg;

  MessageErrorWidget({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            msg,
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
