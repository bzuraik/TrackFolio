import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'teamMembersPage.dart';
import 'page2.dart';
import 'calendarPage.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePageWidget(),
    CalendarPage(),
    Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: Icon(
        Icons.add,
        size: 36,
        color: Colors.white,
      ),
    ),
    teamMembersPage(),
    Page2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? _buildAppBar() : null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                _onItemTapped(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                _onItemTapped(1);
              },
            ),
            SizedBox(width: 30),
            IconButton(
              icon: Image.asset(
                'assets/images/group.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                _onItemTapped(3);
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/images/user.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        height: 50,
      ),
    );
  }
}
