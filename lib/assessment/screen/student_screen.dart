import 'package:flutter/material.dart';
import 'package:student/assessment/Service/service.dart';
import '../model/student.dart';

class StudentScreen extends StatefulWidget {
  Student? student;

  StudentScreen({this.student});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String? course = null;
  String? city = null;
  DbHelper helper = DbHelper();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _totalFeesController = TextEditingController();
  final _contactController = TextEditingController();
  final _marksController = TextEditingController();

  String emailRegx = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  List<String> courses = ['Java', 'Flutter', 'Android', 'Python'];
  List<String> citys = ['Valsad', 'Vapi', 'Surat', 'Baroda', 'Ahmedabad'];
  String? fname, lname, email, address, pincode, totalfees, contact, marks;

  final _formKey = GlobalKey<FormState>();

  Future<void> insertStudent(Student student, BuildContext context) async {
    int result = await helper.insertRecord(student);

    if (result != -1) {
      student.id = result;

      Navigator.pop(context, student);
    } else {
      Navigator.pop(context, null);
    }
  }

  @override
  void initState() {
    super.initState();

    Student? s = widget.student;

    if (s != null) {
      _firstNameController.text = s.firstName;
      _lastNameController.text = s.lastName;
      _emailController.text = s.email;
      _contactController.text = s.contact;
      _addressController.text = s.address;
      _pinCodeController.text = s.pinCode;
      _totalFeesController.text = s.totalFees;
      _marksController.text = s.marks;
      city = s.city;
      course = s.course;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Update Student'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'Student Fname',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Enter student name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    fname = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Student Lname',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name == null || name.isEmpty) {
                      return 'Enter student name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    lname = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Email can\'t be blank';
                    } else if (!RegExp(emailRegx).hasMatch(email)) {
                      return 'Enter valid email address';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  value: course,
                  items: List.generate(
                    courses.length,
                    (index) => DropdownMenuItem(
                      child: Text('${courses[index]}'),
                      value: courses[index],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      course = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Course',
                    border: OutlineInputBorder(),
                  ),
                  validator: (course) {
                    if (course == null) {
                      return 'Please select course';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.streetAddress,
                  validator: (address) {
                    if (address == null) {
                      return 'Enter valid address';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    address = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _pinCodeController,
                  decoration: InputDecoration(
                    labelText: 'pincode',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (pincode) {
                    if (pincode == null || pincode.length != 6) {
                      return 'Pincode must be of 6 digits';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    pincode = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  value: city,
                  items: List.generate(
                    citys.length,
                    (index) => DropdownMenuItem(
                      child: Text('${citys[index]}'),
                      value: citys[index],
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select City',
                    border: OutlineInputBorder(),
                  ),
                  validator: (course) {
                    if (course == null) {
                      return 'Please select course';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _totalFeesController,
                  decoration: InputDecoration(
                    labelText: 'Total fees',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (totalfees) {
                    if (totalfees == null) {
                      return 'Enter Total fees';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    totalfees = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    labelText: 'Contact',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (contact) {
                    if (contact == null || contact.length != 10) {
                      return 'Contact must be of 10 digits';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    contact = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _marksController,
                  decoration: InputDecoration(
                    labelText: 'Marks',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (marks) {
                    if (marks == null) {
                      return 'Enter marks';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    marks = value;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save(); // will call onSave method

                      Student student = Student(
                          firstName: fname!,
                          lastName: lname!,
                          email: email!,
                          address: address!,
                          pinCode: pincode!,
                          course: course!,
                          city: city!,
                          totalFees: totalfees!,
                          contact: contact!,
                          marks: marks!);

                      insertStudent(student, context);
                    }
                  },
                  child: Text(widget.student == null ? 'Register' : 'Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
