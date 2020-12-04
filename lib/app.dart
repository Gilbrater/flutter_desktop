import 'package:auto_route/auto_route.dart';
import 'ui/router/router.gr.dart' as rt;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_big_screen/ui/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_bloc.dart';

class FiscDesktopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (BuildContext context) {
        return ThemeBloc();
      },
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (BuildContext context, isDark) {
          return Builder(
            builder: (context) {
              return MaterialApp(
                builder: ExtendedNavigator<rt.Router>(router: rt.Router()),
                themeMode: ThemeMode.dark,
                theme: AppTheme(isDark: isDark).getTheme(context),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
