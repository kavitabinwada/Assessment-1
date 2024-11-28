import 'package:flutter/material.dart';
import 'package:student/assessment/screen/student_screen.dart';

import 'home_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyanAccent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(),
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('Add Student'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(),
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('View Student'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(),
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('Attendence of Student'),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(),
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('Add Faculty'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(),
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('View Faculty'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(double.maxFinite, 50),
                        shape: RoundedRectangleBorder(),
                        fixedSize: Size(double.infinity, 50)),
                    child: Text('Logout'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
