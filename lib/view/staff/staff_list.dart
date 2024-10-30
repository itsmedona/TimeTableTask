import 'package:flutter/material.dart';

class StaffList extends StatefulWidget {
  @override
  _StaffListState createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  List<String> staffMembers = [];

  void addStaff(String name) {
    setState(() {
      staffMembers.add(name);
    });
  }

  void editStaff(int index, String newName) {
    setState(() {
      staffMembers[index] = newName;
    });
  }

  void deleteStaff(int index) {
    setState(() {
      staffMembers.removeAt(index);
    });
  }

  void showStaffDialog({int? index}) {
    TextEditingController controller = TextEditingController();
    if (index != null) {
      controller.text = staffMembers[index];
    }
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? 'Add Staff' : 'Edit Staff'),
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
                  addStaff(controller.text);
                } else {
                  editStaff(index, controller.text);
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
    'Staffs',
    style: TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.bold, 
      color: Colors.white,))),
      body: ListView.builder(
        itemCount: staffMembers.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(staffMembers[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => showStaffDialog(index: index),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteStaff(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => showStaffDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
