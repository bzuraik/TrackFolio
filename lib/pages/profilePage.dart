// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '/widgets/bottom_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  final Function(int) onItemTapped;

  const ProfilePage({super.key, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: const Center(
        child: Text(
          'Profile',
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
    backgroundColor: const Color(0xFF003B57),
    title: Row(
      children: const [
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
