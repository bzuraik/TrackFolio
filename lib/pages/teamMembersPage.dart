// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import '/widgets/bottom_navigation_bar.dart';

class TeamMember extends StatelessWidget {
  final String imageUrl;
  final String fullName;
  final String position;

  const TeamMember({
    required this.imageUrl,
    required this.fullName,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 30,
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 4.0),
              Text(
                position,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class teamMembersPage extends StatelessWidget {
  final Function(int) onItemTapped;

  teamMembersPage({required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(),
            child: Center(
              child: Text(
                "Team Members",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                  TeamMember(
                    imageUrl: '',
                    fullName: 'John Doe',
                    position: 'Software Engineer',
                  ),
                  TeamMember(
                    imageUrl: '',
                    fullName: 'Jane Smith',
                    position: 'UI Designer',
                  ),
                  TeamMember(
                    imageUrl: '',
                    fullName: 'Jane Smith',
                    position: 'UI Designer',
                  ),
                  TeamMember(
                    imageUrl: '',
                    fullName: 'Jane Smith',
                    position: 'UI Designer',
                  ),
                  TeamMember(
                    imageUrl: '',
                    fullName: 'Jane Smith',
                    position: 'UI Designer',
                  ),
                  TeamMember(
                    imageUrl: '',
                    fullName: 'Jane Smith',
                    position: 'UI Designer',
                  ),
                  TeamMember(
                    imageUrl: '',
                    fullName: 'Jane Smith',
                    position: 'UI Designer',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xFF72C3E6),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: onItemTapped,
      ),
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
