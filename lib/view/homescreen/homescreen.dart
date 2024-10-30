import 'package:flutter/material.dart';
import 'package:timetabletask/view/staff/staff_list.dart';
import '../../widgets/homescreen_widget/homescreen_tile.dart';
import '../course/course_list.dart';
import '../subject/subject_list.dart';
import '../timetable/timetable.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Timetable Generator',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            HomeScreenTile(
              icon: Icons.book,
              label: 'Courses',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseList()),
                );
              },
            ),
            HomeScreenTile(
              icon: Icons.subject,
              label: 'Subjects',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectList()),
                );
              },
            ),
            HomeScreenTile(
              icon: Icons.person,
              label: 'Staff',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StaffList()),
                );
              },
            ),
            HomeScreenTile(
              icon: Icons.calendar_today,
              label: 'Timetable',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Timetable()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
