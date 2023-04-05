import 'package:flutter/material.dart';
import 'package:trackfolio/pages/profilePage.dart';
import '/pages/teamMembersPage.dart';
import '/pages/calendarPage.dart';
import '/pages/homePage.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
}
