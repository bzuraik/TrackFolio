// ignore_for_file: camel_case_types, file_names
import 'package:flutter/material.dart';
import '/widgets/bottom_navigation_bar.dart';
import '../classes/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/widgets/CustomAppBar.dart';

class projectListPage extends StatelessWidget {
  final Function(int) onItemTapped;

  const projectListPage({super.key, required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: BodyWidget(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: onItemTapped,
      ),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final String userId = '46674046405012463842';

  @override
  Widget build(BuildContext context) {
    CollectionReference clientsRef = FirebaseFirestore.instance
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

        final List<Project> projects =
            snapshot.data!.docs.map((DocumentSnapshot document) {
          return Project(
            // Assuming each document has a 'name' field
            projectName: document['name'],
            // Set the clientImage to an empty string or a placeholder image URL
            // Set the clientImage to an empty string or a placeholder image URL
            projectDescription: document[
                'desc'], // Replace this with a placeholder image URL if needed
          );
        }).toList();
        final List<Project> pinnedProjects = projects.take(3).toList();

        return SafeArea(
            child: Column(
          children: <Widget>[
            //Pinned and thumb pin
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Pinned Projects',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const <Widget>[
                      Icon(Icons.push_pin),
                    ],
                  )
                ],
              ),
            ),

            //List of pinned clients
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                //Change the next item to show the number of pinned items
                itemCount: pinnedProjects.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
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
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: Image.asset(
                            'assets/images/projectIcon.png',
                            width: 40.0,
                            height: 40.0,
                          ).image,
                          radius: 30.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            projects[index].projectName,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF003B57),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'All Projects',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.filter_alt),
                        onPressed: () {
                          // handle filter button press
                        },
                        iconSize: 32.0,
                        color: const Color(0xFF003B57),
                        tooltip: 'Filter',
                        splashRadius: 24.0,
                        padding: const EdgeInsets.all(10),
                        constraints: const BoxConstraints(),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                      ),
                      IconButton(
                        icon: const Icon(Icons.sort_by_alpha),
                        onPressed: () {
                          // handle sort button press
                        },
                        iconSize: 32.0,
                        color: const Color(0xFF003B57),
                        tooltip: 'Sort',
                        splashRadius: 24.0,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                      ),
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: projects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 18),
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        color: Color(0xff008BCC),
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/projectIcon.png',
                          width: 40.0,
                          height: 40.0,
                        ),
                        title: Text(
                          projects[index].projectName,
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        subtitle: Text(
                          projects[index].projectDescription,
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
      },
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
