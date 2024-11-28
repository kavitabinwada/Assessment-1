class Student {
  int? id;
  String firstName;
  String lastName;
  String email;
  String address;
  String pinCode;
  String course;
  String city;
  String totalFees;
  String contact;
  String marks;

  Student(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.pinCode,
      required this.course,
      required this.city,
      required this.totalFees,
      required this.contact,
      required this.marks});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'email': this.email,
      'address': this.address,
      'pinCode': this.pinCode,
      'course': this.course,
      'city': this.city,
      'totalFees': this.totalFees,
      'contact': this.contact,
      'marks': this.marks,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      pinCode: map['pinCode'] as String,
      course: map['course'] as String,
      city: map['city'] as String,
      totalFees: map['totalFees'] as String,
      contact: map['contact'] as String,
      marks: map['marks'] as String,
    );
  }
}
