import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timetabletask/view/homescreen/homescreen.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen height and width for responsive layout
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                  child: Container(
                    height: screenHeight * 0.1, // 10% of screen height
                    width: screenWidth * 0.7, // 70% of screen width
                    child: Image.asset("assets/images/timetable.png"),
                  ),
                ),
                SizedBox(
                    height: screenHeight *
                        0.05), // Add spacing between logo and text
                Text(
                  "Timetable App",
                  style: TextStyle(
                    fontSize: screenHeight *
                        0.035, // 3.5% of screen height for responsiveness
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
