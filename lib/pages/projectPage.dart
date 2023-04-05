// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:trackfolio/lists/projectList.dart';
import '/widgets/bottom_navigation_bar.dart';
import '/widgets/CustomAppBar.dart';
import '../classes/project.dart';

class projectPage extends StatelessWidget {
  final Function(int) onItemTapped;

  const projectPage({super.key, required this.onItemTapped});

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
  @override
  Widget build(BuildContext context) {
    final List<Project> projects = ProjectDetails().projectList;
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: <Widget>[
          //Pinned and thumb pin
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Project Overview',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),

          //Project name and description
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/en/d/dc/MichaelScott.png'),
            radius: 70,
          ),

          Container(
            padding: const EdgeInsets.all(10.0),
            child: const ListTile(
              title: Text(
                'Project Name',
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                'This is a project description for the project you just clicked on and related to the client above',
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const <Widget>[
                Text('Labels'),
              ],
            ),
          ),

          Row(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //Change the next item to show the number of pinned items
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 120,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        color: const Color(0xFF72C3E6),
                        border: Border.all(
                          color: const Color(0xFF003B57),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              projects[index].projectName,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const <Widget>[
                Text(
                  'Tasks',
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),

          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              //Change the next item to show the number of pinned items
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 120,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                    color: const Color(0xFF72C3E6),
                    border: Border.all(
                      color: const Color(0xFF003B57),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          projects[index].projectName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
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
                    Text('Comments'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Text('see all'),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
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
