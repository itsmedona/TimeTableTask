import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  List<String> timetableEntries = [];

  void addEntry(String entry) {
    setState(() {
      timetableEntries.add(entry);
    });
  }

  void editEntry(int index, String newEntry) {
    setState(() {
      timetableEntries[index] = newEntry;
    });
  }

  void deleteEntry(int index) {
    setState(() {
      timetableEntries.removeAt(index);
    });
  }

  void showEntryDialog({int? index}) {
    TextEditingController controller = TextEditingController();
    if (index != null) {
      controller.text = timetableEntries[index];
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Add Entry' : 'Edit Entry'),
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
                  addEntry(controller.text);
                } else {
                  editEntry(index, controller.text);
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
      appBar: AppBar(
          title: Text('Timetable',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))),
      body: ListView.builder(
        itemCount: timetableEntries.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(timetableEntries[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showEntryDialog(index: index),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteEntry(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => showEntryDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
