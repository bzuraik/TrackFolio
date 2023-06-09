// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:trackfolio/pages/addClientPage.dart';
import 'teamMembersPage.dart';
import 'profilePage.dart';
import 'calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';
import '/widgets/CustomAppBar.dart';
import 'newProjectPage.dart';
import 'clientListPage.dart';
import 'projectListPage.dart';
import '../classes/client.dart';
import '../classes/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    const String userId = '46674046405012463842';

    CollectionReference clientsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('clients');

    CollectionReference projectsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('projects');

    return StreamBuilder<QuerySnapshot>(
        stream: clientsRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final List<Client> clients =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            return Client(
              // Assuming each document has a 'name' field
              clientName: document['name'],
              // Set the clientImage to an empty string or a placeholder image URL
              clientImage: document[
                  'imageURL'], // Replace this with a placeholder image URL if needed
              clientCompany: document[
                  'company'], // Assuming each document has a 'company' field
            );
          }).toList();

          final List<Client> pinnedClients = clients.take(3).toList();

          return StreamBuilder<QuerySnapshot>(
              stream: projectsRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final List<Project> projects =
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                  return Project(
                    projectName: document['name'],
                    // projectImage: ' ',
                    projectDescription: ' ',
                  );
                }).toList();
                final List<Project> pinnedPorjects = projects.take(4).toList();

                return Scaffold(
                  appBar: _selectedIndex == 0 ? CustomAppBar() : null,
                  body: Column(
                    children: [
                      SizedBox(
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
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => AddClients(
                                                    onItemTapped: _onItemTapped,
                                                  )),
                                        );
                                      },
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
                                              builder: (context) =>
                                                  teamMembersPage(
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
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  clientListPage(
                                                    onItemTapped: _onItemTapped,
                                                  )),
                                        );
                                      },
                                      color: const Color(0xFF008BCC),
                                      textColor: Colors.white,
                                      padding: const EdgeInsets.all(16),
                                      shape: const CircleBorder(),
                                      child:
                                          const Icon(Icons.supervisor_account),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text('Clients'),
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
                        decoration: const BoxDecoration(),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Recent Clients",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Lato',
                                          color: Colors
                                              .white), // Make the text white
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  clientListPage(
                                                    onItemTapped: _onItemTapped,
                                                  )),
                                        );
                                      },
                                      child: const Text(
                                        'See All',
                                        style: TextStyle(
                                            color: Colors
                                                .white), // Make the 'See All' text white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(pinnedClients.length,
                                      (index) {
                                    return Expanded(
                                      child: Container(
                                        height: 110,
                                        width: 120,
                                        margin: const EdgeInsets.all(5.0),
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                          color: const Color(0xFF72C3E6),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 6,
                                              offset: const Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  pinnedClients[index]
                                                      .clientImage),
                                              radius: 30.0,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                pinnedClients[index].clientName,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xFF003B57),
                                                ),
                                              ),
                                            ),
                                          ],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Recent Projects",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Lato',
                                          color: Colors
                                              .white), // Make the text white
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  projectListPage(
                                                    onItemTapped: _onItemTapped,
                                                  )),
                                        );
                                      },
                                      child: const Text(
                                        'See All',
                                        style: TextStyle(
                                            color: Colors
                                                .white), // Make the 'See All' text white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width / 2,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    childAspectRatio: MediaQuery.of(context)
                                            .size
                                            .width /
                                        (MediaQuery.of(context).size.height /
                                            4),
                                  ),
                                  itemCount: projects.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final Project project = projects[index];
                                    return Card(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                              'assets/images/projectIcon.png'),
                                          Text(pinnedPorjects[index]
                                              .projectName),
                                        ],
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
                    backgroundColor: const Color(0xFF72C3E6),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewProjectPage(
                                  onItemTapped: (int) {},
                                )),
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                  bottomNavigationBar: BottomNavBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                  ),
                );
              });
        });
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
