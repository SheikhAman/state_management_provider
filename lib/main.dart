import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statepract_1/provider/auth_provider.dart';
import 'package:statepract_1/provider/count_provider.dart';
import 'package:statepract_1/provider/example_one_provider.dart';
import 'package:statepract_1/provider/favourite_provider.dart';
import 'package:statepract_1/provider/theme_changer_provider.dart';
import 'package:statepract_1/screen/count_provider_example.dart';
import 'package:statepract_1/screen/dark_theme.dart';
import 'package:statepract_1/screen/example_one_screen.dart';
import 'package:statepract_1/screen/favourite/favourite_screen.dart';
import 'package:statepract_1/screen/login_screen.dart';
import 'package:statepract_1/screen/value_notify_listner.dart';

import 'stateless_widget_screen.dart';
import './statefull_widget_screen.dart';
import './why_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeChangerProvider = Provider.of<ThemeChangerProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavouriteProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChangerProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final themeChanger = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeChanger.themeMode,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.red,
                brightness: Brightness.light,
                iconTheme: const IconThemeData(
                  color: Colors.purple,
                ),
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.pink,
                  primaryColor: Colors.yellow,
                  iconTheme: const IconThemeData(
                    color: Colors.pink,
                  ),
                  appBarTheme: const AppBarTheme(
                    color: Colors.teal,
                  )),
              home: LoginScreen(),
            );
          },
        ));
  }
}
