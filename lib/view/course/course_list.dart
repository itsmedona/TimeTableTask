import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<String> courses = [];

  void addCourse(String course) {
    setState(() {
      courses.add(course);
    });
  }

  void editCourse(int index, String newCourse) {
    setState(() {
      courses[index] = newCourse;
    });
  }

  void deleteCourse(int index) {
    setState(() {
      courses.removeAt(index);
    });
  }

  void showCourseDialog({int? index}) {
    TextEditingController controller = TextEditingController();
    if (index != null) {
      controller.text = courses[index];
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Add Course' : 'Edit Course'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                if (index == null) {
                  addCourse(controller.text);
                } else {
                  editCourse(index, controller.text);
                }
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(
    'Courses',
    style: TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.bold, 
      color: Colors.white,))), 
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(courses[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showCourseDialog(index: index),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteCourse(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => showCourseDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
