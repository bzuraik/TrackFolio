import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'homePage.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF003B57),
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
