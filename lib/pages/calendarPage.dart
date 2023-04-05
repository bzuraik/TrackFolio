// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '/widgets/bottom_navigation_bar.dart';
import '/widgets/calendar_table.dart';
import '/widgets/CustomAppBar.dart';

class CalendarPage extends StatefulWidget {
  final Function(int) onItemTapped;

  const CalendarPage({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CalendarTable(
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                todayBuilder: (context, date, _) {
                  if (isSameDay(date, _selectedDay)) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          '${date.day}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: Text(
                        '${date.day}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    );
                  }
                },
              ),
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
}
