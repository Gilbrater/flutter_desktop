import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarBottomArea extends StatelessWidget {
  final EdgeInsets padding;

  const SidebarBottomArea({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: padding,
            child: Image.asset(
              'assets/images/Klarna-logo-1.jpg',
              fit: BoxFit.contain,
              width: 170,
            ),
          ),
        ),
      ],
    );
  }
}
