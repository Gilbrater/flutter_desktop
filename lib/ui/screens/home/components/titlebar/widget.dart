import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;

  TitleBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Align(
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
