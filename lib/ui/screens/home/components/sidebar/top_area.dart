import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SidebarTopArea extends StatelessWidget {
  final EdgeInsets padding;

  const SidebarTopArea({
    Key key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: padding,
            child: Text(
              "Fixed Sum Credit",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 22
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: padding,
            child: Text(
              "Helpdesk",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22
              ),
            ),
          ),
        )
      ],
    );
  }
}
