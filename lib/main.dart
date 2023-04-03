import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/loadingPage.dart';
import 'pages/calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//   String userId = generateRandomId();
//   await createUser(userId, 'JohnDoe', 'password123');

// // Adding 3 dummy clients to the user
//   for (int i = 1; i <= 3; i++) {
//     String clientId = generateRandomId();
//     await addClient(userId, clientId, 'Client $i');
//   }

// // Adding 5 dummy projects to the user and assigning them to random clients
//   for (int i = 1; i <= 5; i++) {
//     String projectId = generateRandomId();
//     String clientId =
//         generateRandomId(); // Replace this line with the actual client ID from your clients
//     await addProject(userId, projectId, 'Project $i', clientId);
//   }
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

// Future<void> createUser(String userId, String username, String password) async {
//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   return users
//       .doc(userId)
//       .set({
//         'username': username,
//         'password': password,
//       })
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }

// Future<void> addClient(
//     String userId, String clientId, String clientName) async {
//   CollectionReference clients = FirebaseFirestore.instance
//       .collection('users')
//       .doc(userId)
//       .collection('clients');

//   return clients
//       .doc(clientId)
//       .set({
//         'name': clientName,
//       })
//       .then((value) => print("Client Added"))
//       .catchError((error) => print("Failed to add client: $error"));
// }

// Future<void> addProject(String userId, String projectId, String projectName,
//     String clientId) async {
//   CollectionReference projects = FirebaseFirestore.instance
//       .collection('users')
//       .doc(userId)
//       .collection('projects');

//   return projects
//       .doc(projectId)
//       .set({
//         'name': projectName,
//         'clientId': clientId,
//       })
//       .then((value) => print("Project Added"))
//       .catchError((error) => print("Failed to add project: $error"));
// }

// String generateRandomId() {
//   var random = Random();
//   return List.generate(20, (index) => random.nextInt(9).toString()).join();
// }
