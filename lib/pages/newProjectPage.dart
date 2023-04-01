import 'package:flutter/material.dart';
import 'homePage.dart';
import '/pages/calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';

class NewProjectPage extends StatelessWidget {
  final Function(int) onItemTapped;

  NewProjectPage({required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: Text(
          'New Project Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: onItemTapped,
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFF003B57),
    title: Row(
      children: [
        Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        SizedBox(width: 20),
        Spacer(),
        Icon(
          Icons.search,
          color: Colors.white,
        ),
      ],
    ),
  );
}
