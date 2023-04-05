import 'package:flutter/material.dart';
import 'package:trackfolio/pages/profilePage.dart';
import '/pages/teamMembersPage.dart';
import '/pages/calendarPage.dart';
import '/pages/homePage.dart';

// Custom bottom navigation bar widget
class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF003B57),
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/calendar.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => CalendarPage(
                          onItemTapped: _onItemTapped,
                        )),
              );
            },
          ),
          const SizedBox(width: 30),
          IconButton(
            icon: Image.asset(
              'assets/images/group.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => teamMembersPage(
                          onItemTapped: _onItemTapped,
                        )),
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/user.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          onItemTapped: _onItemTapped,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
