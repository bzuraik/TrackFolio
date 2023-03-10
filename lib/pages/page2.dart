import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text(
          'This is Page 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
