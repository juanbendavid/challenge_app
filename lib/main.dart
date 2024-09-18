import 'package:challenge_app/config/theme/theme.dart';
import 'package:challenge_app/pages/detail_page.dart';
import 'package:challenge_app/pages/home_page.dart';
import 'package:challenge_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProductProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Product App",
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/detail': (context) => const DetailPage(),
        },
        theme: ThemeApp().theme(),
      ),
    );
  }
}
