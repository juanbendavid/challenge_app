import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData theme() => ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
        useMaterial3: true,
        primaryColor: const Color(0xFFfef682), 
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black, 
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
          headlineMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // Color predeterminado para los iconos
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          shadowColor: Colors.grey.withOpacity(0.2),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ), colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFfef682),
          brightness: Brightness.light,
        ).copyWith(background: Colors.white),
      );
}
