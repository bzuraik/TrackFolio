import 'package:flutter/material.dart';
import 'page2.dart';

class teamMembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is Page 1',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              child: Text('Go to Page 2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
