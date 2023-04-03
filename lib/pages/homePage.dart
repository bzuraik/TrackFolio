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
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
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

                // Existing buttons and their rows here
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
            decoration: BoxDecoration(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff008BCC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0), // Add horizontal padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Clients",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white), // Make the text white
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle 'See All' action here
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: Colors
                                    .white), // Make the 'See All' text white
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Wrap(
                      spacing: 1.0,
                      runSpacing: 4.0,
                      children: List.generate(3, (index) {
                        return Container(
                          height: 100,
                          width: 120,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Add a bit of radius to the cards
                            ),
                            color: Color.fromARGB(255, 231, 231,
                                227), // Set the card background color
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(child: Text("Client Name")),
                                    ],
                                  ),
                                  // Add more information about the client here
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0), // Add horizontal padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Projects",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white), // Make the text white
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle 'See All' action here
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                                color: Colors
                                    .white), // Make the 'See All' text white
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width /
                        2, // Adjust height based on screen width
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height /
                                4), // Adjust the aspect ratio based on screen size
                      ),
                      itemCount: 4, // Number of projects to display
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child:
                                  Text("Project Name"), // Add project name here
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
