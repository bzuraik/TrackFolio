// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'teamMembersPage.dart';
import 'profilePage.dart';
import 'calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      const HomePageWidget(),
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
      body: SizedBox(
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
                      color: const Color(0xFF008BCC),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 4),
                    const Text('New Clients'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xFF008BCC),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.cloud_upload),
                    ),
                    const SizedBox(height: 4),
                    const Text('Upload'),
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
                      color: const Color(0xFF008BCC),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.people),
                    ),
                    const SizedBox(height: 4),
                    const Text('Team'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xFF008BCC),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.bar_chart),
                    ),
                    const SizedBox(height: 4),
                    const Text('Statistics'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {},
                      color: const Color(0xFF008BCC),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                      child: const Icon(Icons.perm_contact_calendar),
                    ),
                    const SizedBox(height: 4),
                    const Text('Clients'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF72C3E6),
        onPressed: () {},
        child: const Icon(
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
