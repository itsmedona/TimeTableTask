import 'package:flutter/material.dart';
import 'package:timetabletask/view/timetable/timetable.dart';


void main() {
  runApp(timetableapp());
}
class timetableapp extends StatelessWidget {
  const timetableapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Timetable(),
    );
  }
}