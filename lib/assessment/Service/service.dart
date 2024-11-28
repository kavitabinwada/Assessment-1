import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/student.dart';

class DbHelper {
  static const DB_VERSION = 1;

  // Database Name
  static const DB_NAME = 'task.db';

  // Table Name
  static const TBL_STUDENT = 'students';

  // Column Name
  static const COL_ID = 'id';
  static const COL_FNAME = 'fname';
  static const COL_LNAME = 'lname';
  static const COL_EMAIL = 'email';
  static const COL_COURSES = 'course';
  static const COL_ADDRESS = 'address';
  static const COL_PINCODE = 'pincode';
  static const COL_CITY = 'city';
  static const COL_TOTALFEES = 'totalfees';
  static const COL_CONTACT = 'contact';
  static const COL_MARKS = 'marks';

  static DbHelper? _instance;
  static Database? _database;

  factory DbHelper() {
    return _instance ??= DbHelper._internal();
  }

  DbHelper._internal();

  Future<Database?> getDatabase() async {
    _database ??= await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    var rootPath = await getDatabasesPath();
    print('root path : $rootPath');

    var basePath = join(rootPath, DB_NAME);
    print('base path : $basePath');

    return await openDatabase(
      basePath,
      version: DB_VERSION,
      onCreate: (db, version) async {
        // create all your tables
        await db.execute('CREATE TABLE $TBL_STUDENT ('
            '$COL_ID INTEGER PRIMARY KEY AUTOINCREMENT'
            '$COL_FNAME TEXT NOT NULL,'
            '$COL_LNAME TEXT NOT NULL,'
            '$COL_EMAIL TEXT NOT NULL,'
            '$COL_CONTACT TEXT NOT NULL,'
            '$COL_ADDRESS TEXT NOT NULL,'
            '$COL_COURSES TEXT NOT NULL,'
            '$COL_PINCODE TEXT NOT NULL,'
            '$COL_TOTALFEES TEXT NOT NULL,'
            '$COL_MARKS TEXT NOT NULL)');
      },
    );
  }

  Future<int> insertRecord(Student student) async {
    Database? database = await getDatabase();
    try {
      int id = await database!.insert(TBL_STUDENT, student.toMap());
      return id;
    } catch (e) {
      return -1;
    }
  }

  Future<List<Student>> readRecord() async {
    Database? database = await getDatabase();
    List<Student> studentList = [];

    try {
      List<Map<String, Object?>>? map = await database?.query(TBL_STUDENT);
      print(map);

      // convert List<Map<Key,Object>> into List<Student>
      studentList = List.generate(
        map!.length,
        (index) => Student.fromMap(map[index]),
      ).toList();
    } catch (e) {}

    return studentList;
  }

  Future<int> deleteRecord(int id) async {
    Database? database = await getDatabase();
    //printf("value of sum = %d", sum);
    try {
      int res =
          await database!.delete(TBL_STUDENT, where: 'id = ?', whereArgs: [id]);
      return res;
    } catch (e) {
      return -1;
    }
  }

  Future<int> updateRecord(Student student) async {
    Database? database = await getDatabase();

    if (database != null) {
      return database.update(TBL_STUDENT, student.toMap(),
          where: "$COL_ID = ?", whereArgs: [student.id]);
    }
    return 0;
  }
}
