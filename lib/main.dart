import 'package:flutter/material.dart';
import 'package:productivity_app/layouts/homepage/home_page.dart';
import 'package:productivity_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'provider/task_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Productivity App',
          theme:
              themeProvider.isCupertino ? ThemeData.light() : ThemeData.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}
