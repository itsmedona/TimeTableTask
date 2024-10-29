import 'package:flutter/material.dart';

import 'view/homescreen/homescreen.dart';

void main() {
  runApp(timetableapp());
}
class timetableapp extends StatelessWidget {
  const timetableapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}