import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'teamMembersPage.dart';
import 'profilePage.dart';
import 'calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';
import 'newProjectPage.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xFF008BCC),
                      textColor: Colors.white,
                      child: Icon(Icons.add),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    SizedBox(height: 4),
                    Text('New Clients'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xFF008BCC),
                      textColor: Colors.white,
                      child: Icon(Icons.cloud_upload),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    SizedBox(height: 4),
                    Text('Upload'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => teamMembersPage(
                                    onItemTapped: _onItemTapped,
                                  )),
                        );
                      },
                      color: Color(0xFF008BCC),
                      textColor: Colors.white,
                      child: Icon(Icons.people),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    SizedBox(height: 4),
                    Text('Team'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xFF008BCC),
                      textColor: Colors.white,
                      child: Icon(Icons.bar_chart),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    SizedBox(height: 4),
                    Text('Statistics'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: Color(0xFF008BCC),
                      textColor: Colors.white,
                      child: Icon(Icons.supervisor_account),
                      padding: EdgeInsets.all(16),
                      shape: CircleBorder(),
                    ),
                    SizedBox(height: 4),
                    Text('Clients'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF72C3E6),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NewProjectPage(
                      onItemTapped: (int) {},
                    )),
          );
        },
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
