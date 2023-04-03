// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '/widgets/bottom_navigation_bar.dart';

class ProfilePage extends StatefulWidget {
  final Function(int) onItemTapped;

  const ProfilePage({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<bool> _isOptionEnabled = List.generate(12, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Profile Settings',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              _buildExpandableBox(
                'General',
                [
                  _buildToggleOption('Option 1', 0),
                  _buildToggleOption('Option 2', 1),
                  _buildToggleOption('Option 3', 2),
                ],
              ),
              _buildExpandableBox(
                'Accessibility',
                [
                  _buildToggleOption('Option 4', 3),
                  _buildToggleOption('Option 5', 4),
                  _buildToggleOption('Option 6', 5),
                ],
              ),
              _buildExpandableBox(
                'Security',
                [
                  _buildToggleOption('Option 7', 6),
                  _buildToggleOption('Option 8', 7),
                  _buildToggleOption('Option 9', 8),
                ],
              ),
              _buildExpandableBox(
                'Privacy',
                [
                  _buildToggleOption('Option 10', 9),
                  _buildToggleOption('Option 11', 10),
                  _buildToggleOption('Option 12', 11),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: widget.onItemTapped,
      ),
    );
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

  Widget _buildExpandableBox(String title, List<Widget> children) {
    return ExpansionTile(
      title: Text(title),
      children: children,
    );
  }

  Widget _buildToggleOption(String title, int index) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: _isOptionEnabled[index],
        onChanged: (newValue) {
          setState(() {
            _isOptionEnabled[index] = newValue;
          });
        },
      ),
    );
  }
}
