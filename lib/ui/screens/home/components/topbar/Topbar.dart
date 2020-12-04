import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_big_screen/bloc/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Topbar extends StatefulWidget {
  @override
  _TopbarState createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  List<bool> _selections = List.generate(3, (_) => false);
  bool isSwitched = false;

  @override
  void initState() {
    _selections[0] = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Align(
        child: SizedBox(
          width: 1200,
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              Expanded(
                child: Container(
                  child: ToggleButtons(
                    children: [
                      Text("Local"),
                      Text("Staging"),
                      Text("Production"),
                    ],
                    constraints: BoxConstraints(minWidth: 100, minHeight: 30),
                    color: Colors.grey,
                    selectedColor: Colors.white,
                    fillColor: Colors.green,
                    renderBorder: false,
                    borderRadius: BorderRadius.circular(30),
                    borderWidth: 1,
                    borderColor: Colors.grey,
                    selectedBorderColor: Colors.grey,
                    focusColor: Colors.white70,
                    //hoverColor: Colors.white70,
                    onPressed: (int index){
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            _selections[buttonIndex] = true;
                          } else {
                            _selections[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: _selections,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("US"),
                    Switch(
                      value: isSwitched,
                      activeColor: Colors.pinkAccent,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                    ),
                    Text("EU"),
                    SizedBox(width: 35),
                    BlocBuilder<ThemeBloc, bool>(
                      builder: (BuildContext context, isDarkMode) {
                        return IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          icon: Icon(isDarkMode
                              ? FeatherIcons.sun
                              : FeatherIcons.moon),
                          onPressed: () {
                            BlocProvider.of<ThemeBloc>(context).add(
                              isDarkMode ? LightTheme() : DarkTheme(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
BlocBuilder<ThemeBloc, bool>(
                    bloc: BlocProvider.of<ThemeBloc>(context),
                    builder: (context, isDark) {
                      return TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          prefixIcon: Icon(
                            FeatherIcons.search,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Search on Twitter',
                          labelStyle: TextStyle(
                            color: isDark
                                ? Colors.white.withOpacity(.3)
                                : Colors.black.withOpacity(.3),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      );
                    },
                  ),
 */