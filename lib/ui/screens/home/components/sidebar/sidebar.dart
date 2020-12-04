import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_big_screen/ui/screens/home/components/sidebar/bottom_area.dart';
import 'package:flutter_big_screen/ui/screens/home/components/sidebar/navigation/item.dart';
import 'package:flutter_big_screen/ui/screens/home/components/sidebar/navigation/widget.dart';
import 'package:flutter_big_screen/ui/screens/home/components/sidebar/top_area.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'navigation/model/navigation_item.dart';

class Sidebar extends StatefulWidget {
  final double width;
  final Function(int page) onSelectPage;

  const Sidebar({
    Key key,
    this.width,
    this.onSelectPage,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _currentIndex = 0;
  final _navigation = <NavigationItem>[
    NavigationItem(
      isSelected: true,
      icon: FeatherIcons.home,
      label: 'Order Overview',
    ),
    NavigationItem(
      icon: FeatherIcons.globe,
      label: 'Fisc Service API',
    ),
    NavigationItem(
      icon: FeatherIcons.repeat,
      label: 'Autopay Summary',
    ),
    NavigationItem(
      icon: FeatherIcons.alertCircle,
      label: 'Unstable Loan',
    ),
    NavigationItem(
      icon: FeatherIcons.activity,
      label: 'Calc Spotcheck',
    ),
    NavigationItem(
      icon: FeatherIcons.settings,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      width: widget.width,
      child: ListView(
        children: [
          SidebarTopArea(
            padding: const EdgeInsets.all(1),
          ),
          SizedBox(height: 50),
          NavigationBar(
            selectedIndex: _currentIndex,
            children: [
              for (int i = 0; i < _navigation.length; i++)
                NavigationBarItem(
                  isSelected: i == _currentIndex,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  icon: Icon(
                    _navigation[i].icon,
                  ),
                  label: _navigation[i].label,
                  onTap: () {
                    setState(() {
                      _currentIndex = i;
                    });
                    widget.onSelectPage(i);
                  },
                ),
              NavigationBarItem(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                icon: Icon(
                  FeatherIcons.moreVertical,
                ),
                label: 'More',
                onTap: () {},
              ),
              SizedBox(
                height: 220,
              ),
              SidebarBottomArea(
                padding: const EdgeInsets.all(15),
              )
            ],
          )
        ],
      ),
    );
  }
}
