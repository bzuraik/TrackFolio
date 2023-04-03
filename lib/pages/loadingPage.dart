// ignore_for_file: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'homePage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF003B57),
        child: Center(
          child: SizedBox(
            width: 150, // Adjust the width of the logo
            height: 150, // Adjust the height of the logo
            child: SvgPicture.asset(
              'assets/images/logo2.svg',
            ),
          ),
        ),
      ),
    );
  }
}
