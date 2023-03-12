import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/loadingPage.dart';
import 'pages/calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LoadingPage(),
      routes: {
        '/': (BuildContext context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/calendar': (context) => CalendarPage(onItemTapped: (index) {}),
      },
    );
  }
}
