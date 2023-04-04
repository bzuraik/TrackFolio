import 'package:flutter/material.dart';
import 'package:trackfolio/lists/projectList.dart';
import '/widgets/bottom_navigation_bar.dart';
import '../classes/project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class projectListPage extends StatelessWidget {
  final Function(int) onItemTapped;

  projectListPage({required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    final List<Project> projects = ProjectDetails().projectList;
    return SafeArea(
        child: Column(
      children: <Widget>[
        //Pinned and thumb pin
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
                children: <Widget>[
                  Icon(Icons.push_pin),
                ],
              )
            ],
          ),
        ),

        //List of pinned clients
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //Change the next item to show the number of pinned items
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 110,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  color: Color(0xFF72C3E6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('${projects[index].projectImage}'),
                      radius: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '${projects[index].projectName}',
                        style: TextStyle(
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
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
                    icon: Icon(Icons.filter_alt),
                    onPressed: () {
                      // handle filter button press
                    },
                    iconSize: 32.0,
                    color: Color(0xFF003B57),
                    tooltip: 'Filter',
                    splashRadius: 24.0,
                    padding: EdgeInsets.all(10),
                    constraints: BoxConstraints(),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  IconButton(
                    icon: Icon(Icons.sort_by_alpha),
                    onPressed: () {
                      // handle sort button press
                    },
                    iconSize: 32.0,
                    color: Color(0xFF003B57),
                    tooltip: 'Sort',
                    splashRadius: 24.0,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
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
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Color(0xFF72C3E6),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage('${projects[index].projectImage}'),
                      radius: 30.0,
                    ),
                    title: Text("${projects[index].projectName}"),
                    subtitle: Text("${projects[index].projectDescription}"),
                  ),
                );
              }),
        ),
      ],
    ));
  }
}

AppBar _buildAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
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
