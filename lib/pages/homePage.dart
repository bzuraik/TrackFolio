import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'teamMembersPage.dart';
import 'profilePage.dart';
import 'calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';

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
  late List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _HomePageState() {
    _widgetOptions = <Widget>[
      HomePageWidget(),
      CalendarPage(onItemTapped: _onItemTapped),
      teamMembersPage(onItemTapped: _onItemTapped),
      ProfilePage(onItemTapped: _onItemTapped),
    ];
  }

  // static List<Widget> _widgetOptions = <Widget>[
  //   HomePageWidget(),
  //   CalendarPage(),
  //   teamMembersPage(),
  //   Page2(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? _buildAppBar() : null,
      body: Column(
        children: [
          // First row of buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 1'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 2'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 3'),
                  ),
                ),
              ),
            ],
          ),
          // Second row of buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 4'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Button 5'),
                  ),
                ),
              ),
            ],
          ),
          // Remaining 65% of the home page
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF72C3E6),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

//top bar navigation
AppBar _buildAppBar() {
  return AppBar(
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
