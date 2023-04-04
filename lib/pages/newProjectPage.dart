// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import '/widgets/bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewProjectPage extends StatefulWidget {
  final Function(int) onItemTapped;

  const NewProjectPage({super.key, required this.onItemTapped});

  @override
  State<NewProjectPage> createState() => _NewProjectPageState();
}

class _NewProjectPageState extends State<NewProjectPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitProject() async {
    final String name = _nameController.text;
    final String description = _descriptionController.text;

    FirebaseFirestore.instance
        .collection('users')
        .doc('46674046405012463842')
        .collection('projects')
        .add({
      'name': name,
      'desc': description,
    }).then((value) {
      print('Project added to Firestore!');
      Navigator.pushNamed(context, '/home');
    }).catchError((error) {
      print('Failed to add project: $error');
    });
  }

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
              controller: _nameController,
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
              'Overview/Description',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: _descriptionController,
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
              onPressed: _submitProject,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: widget.onItemTapped,
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
