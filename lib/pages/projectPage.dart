import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trackfolio/lists/projectList.dart';
import '/widgets/bottom_navigation_bar.dart';
import '../classes/project.dart';

class projectPage extends StatelessWidget {
  final Function(int) onItemTapped;

  projectPage({required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child:BodyWidget(),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: onItemTapped,
      ),
    );
  }
}

class BodyWidget extends StatefulWidget{
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
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Project Overview',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25,),
                    ),
                  ],
                ),
              ),

              //Project name and description
              Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/en/d/dc/MichaelScott.png'),
                  radius: 70,
                ),
              ),

              Container(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text('Project Name', textAlign: TextAlign.center,),
                  subtitle: Text('This is a project description for the project you just clicked on and related to the client above', textAlign: TextAlign.center,),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Text('Labels'),
                  ],
                ),
              ),

              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //Change the next item to show the number of pinned items
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 120,
                            margin: EdgeInsets.all(10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                                bottomLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0),
                              ),
                              color: Color(0xFF72C3E6),
                              border: Border.all(
                                color: Color(0xFF003B57),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text('${projects[index].projectName}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white,),),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Text('Tasks', textAlign: TextAlign.start,),
                  ],
                ),
              ),

              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  //Change the next item to show the number of pinned items
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 120,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        color: Color(0xFF72C3E6),
                        border: Border.all(
                          color: Color(0xFF003B57),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text('${projects[index].projectName}', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white,),),
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
                        Text('Comments'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('see all'),
                      ],
                    )
                  ],
                ),
              ),



            ],
          )
      ),
    );
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