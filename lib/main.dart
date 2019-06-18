import 'package:flutter/material.dart';
import 'package:waste_sorting_helper/views/home_page.dart';
import 'package:waste_sorting_helper/providers/wast_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<WastProvider>.value(
      value: WastProvider(),
      child: MaterialApp(
        title: 'Wast Sorting Helper',
        theme: ThemeData(
            primaryColor: Colors.grey[500],
            buttonTheme: ButtonThemeData(
              minWidth: 20,
            ),
            appBarTheme: AppBarTheme(
                color: Colors.grey[50],
                elevation: 0,
                textTheme: TextTheme(
                    title: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)))),
        home: MyHomePage(),
      ),
    );
  }
}
