import 'package:flutter/material.dart';
import 'homePage.dart';
import '/pages/calendarPage.dart';
import '/widgets/bottom_navigation_bar.dart';

class NewProjectPage extends StatelessWidget {
  final Function(int) onItemTapped;

  NewProjectPage({required this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF008BCC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        height: MediaQuery.of(context).size.height * 1,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Project Name',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Profiles',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: const <Widget>[
                Expanded(
                  child: CircleAvatar(child: Text('1')),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: CircleAvatar(child: Text('2')),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: CircleAvatar(child: Text('3')),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: CircleAvatar(child: Text('4')),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: CircleAvatar(child: Text('5')),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Overview/Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
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

// if profiles want to be scrollable

/*
SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        CircleAvatar(child: Text('1')),
        SizedBox(width: 8.0),
        CircleAvatar(child: Text('2')),
        SizedBox(width: 8.0),
        CircleAvatar(child: Text('3')),
        SizedBox(width: 8.0),
        CircleAvatar(child: Text('4')),
        SizedBox(width: 8.0),
        CircleAvatar(child: Text('5')),
      ],
    ),
  ),
*/
