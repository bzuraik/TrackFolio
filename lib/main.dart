import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/loadingPage.dart';
import 'pages/calendarPage.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Entry point of the application
void main() async {
  // Ensures that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Run the app
  runApp(const MyApp());
}

// Root widget of the app
class MyApp extends StatelessWidget {
  // Constructor with optional key parameter
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Routes for navigating between pages
      routes: {
        '/': (BuildContext context) => const LoadingPage(),
        '/home': (context) => const HomePage(),
        '/calendar': (context) => CalendarPage(onItemTapped: (index) {}),
      },
    );
  }
}
