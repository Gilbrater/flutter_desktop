import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_big_screen/ui/screens/home/views/autopay_summary/widget.dart';
import 'package:flutter_big_screen/ui/screens/home/views/calc_spotcheck/widget.dart';
import 'package:flutter_big_screen/ui/screens/home/views/fisc_api/widget.dart';
import 'package:flutter_big_screen/ui/screens/home/views/order_overview/widget.dart';
import 'package:flutter_big_screen/ui/screens/home/views/settings/widget.dart';
import 'package:flutter_big_screen/ui/screens/home/views/unstable_debts/widget.dart';

import 'components/sidebar/sidebar.dart';
import 'components/topbar/Topbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
    );

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: 200,
              right: 0,
              bottom: 0,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  OrderOverview(),
                  FiscAPI(),
                  AutopaySummary(),
                  UnstableDebts(),
                  CalcSpotcheck(),
                  Settings(),
                ],
              ),
            ),
            Positioned(
              left: 200,
              top: 0,
              right: 0,
              child: Align(
                child: Topbar(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              child: Sidebar(
                  width: 200,
                  onSelectPage: (page) {
                    _pageController.jumpToPage(
                      page
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
