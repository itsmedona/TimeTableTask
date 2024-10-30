import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  List<String> subjects = [];

  void addSubject(String subject) {
    setState(() {
      subjects.add(subject);
    });
  }

  void editSubject(int index, String newSubject) {
    setState(() {
      subjects[index] = newSubject;
    });
  }

  void deleteSubject(int index) {
    setState(() {
      subjects.removeAt(index);
    });
  }

  void showSubjectDialog({int? index}) {
    TextEditingController controller = TextEditingController();
    if (index != null) {
      controller.text = subjects[index];
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Add Subject' : 'Edit Subject'),
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
                  addSubject(controller.text);
                } else {
                  editSubject(index, controller.text);
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
    'Subjects',
    style: TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.bold, 
      color: Colors.white,))),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(subjects[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showSubjectDialog(index: index),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteSubject(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => showSubjectDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
