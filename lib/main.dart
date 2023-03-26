import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/loadingPage.dart';
import 'pages/calendarPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (BuildContext context) => const LoadingPage(),
        '/home': (context) => const HomePage(),
        '/calendar': (context) => CalendarPage(onItemTapped: (index) {}),
      },
    );
  }
}
