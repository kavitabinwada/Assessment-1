import 'package:flutter/material.dart';
import 'package:student/assessment/screen/student_screen.dart';

import '../model/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> studentList = [];

  void _removeStudent(Student student) {
    setState(() {
      studentList.removeWhere((s) => s.firstName == student.firstName);
    });
  }

  void _updateRecord(Student student) {
    var index = studentList
        .indexWhere((element) => element.firstName == student.firstName);

    if (index != -1) {
      setState(() {
        studentList[index] = student;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          Student student = studentList[index];

          return Card(
            elevation: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text(
                      '${student.firstName[0].toUpperCase()}',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${student.firstName}',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            PopupMenuButton(
                              onSelected: (value) async {
                                switch (value) {
                                  case 0:
                                    // navigate to edit screen
                                    Student? s = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StudentScreen(
                                          student: student,
                                        ),
                                      ),
                                    );

                                    if (s != null) {
                                      _updateRecord(s);
                                    }
                                    break;
                                  case 1:
                                    // show delete dialog
                                    var action = await _showAlertDialog(
                                      context,
                                      'Alert',
                                      'This item will be removed permanently.',
                                    );

                                    if (action) {
                                      _removeStudent(student);
                                    }
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text('Delete'),
                                  value: 1,
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${student.email}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'CONTACT : ',
                            style: TextStyle(color: Colors.purple),
                            children: [
                              TextSpan(
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                text: '${student.contact}',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'LAST NAME',
                                  style: TextStyle(color: Colors.purple),
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      text: '${student.lastName}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Student? student = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentScreen(
                student: null,
              ),
            ),
          );

          if (student != null) {
            setState(() {
              studentList.add(student);
              print('student added successfully..');
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<bool> _showAlertDialog(
      BuildContext context, String title, String message) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('Delete'),
          )
        ],
      ),
    );
  }
}
