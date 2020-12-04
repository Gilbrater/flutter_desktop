import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_big_screen/ui/screens/home/components/app_card/AppCard.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class OrderOverview extends StatefulWidget {
  @override
  _OrderOverviewState createState() => _OrderOverviewState();
}

class _OrderOverviewState extends State<OrderOverview> {
  String dropdownValue = 'Order ID';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 800,
                child: CustomScrollView(
                  shrinkWrap: false,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(10.0),
                      sliver: SliverAppBar(
                        pinned: true,
                        title: Text('Order Overview'),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(20.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            AppCard(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text("Enter Data"),
                                  ),
                                  Row(children: [
                                    DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: Icon(FeatherIcons.chevronDown, color: Colors.white),
                                      iconSize: 24,
                                      elevation: 16,
                                      dropdownColor: Colors.white24,
                                      style: TextStyle(color: Colors.white),
                                      underline: Container(
                                        height: 2,
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Order ID',
                                        'Order Krn',
                                        'Debt ID',
                                        'Debt KRN',
                                        'Loan ID',

                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    SizedBox(width: 15),
                                    Flexible(child: TextFormField()),
                                    SizedBox(width: 15),
                                    RaisedButton(
                                      child: Text("Search", style: TextStyle(color: Colors.white),),
                                    )
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 15),
                            AppCard(
                              child: Container(
                                height: 200,
                                width: 400,
                                color: Colors.grey,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: AppCard(
              child: Container(
              height: 500,
              width: 400,
              color: Colors.blueGrey,
            ),),
          ),
        ],
      ),
    );
  }
}
