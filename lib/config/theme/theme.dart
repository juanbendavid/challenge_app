import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData theme() => ThemeData(
        useMaterial3: true,
        actionIconTheme: ActionIconThemeData(

        ),
        appBarTheme: const AppBarTheme(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      );
}