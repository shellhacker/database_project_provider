import 'dart:convert';
import 'dart:io';

import 'package:database_project/controller/student_model.dart';
import 'package:database_project/view/Screen_homepage/db/db%20model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

Future<void> addStudent(StudentModel value) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  final _id = await studentDB.add(value);
  value.id = _id;
  studentDB.put(value.id, value);
}

Future<void> getAllStudents(BuildContext context) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  Provider.of<StudentModelProvider>(context, listen: false)
      .addAllStudent(data: studentDB.values);
}

Future<void> deleteStudent(context, int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.deleteAt(id);

  await getAllStudents(context);
}

Future<void> editStudent({context, required data, required index}) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(index, data);
  await getAllStudents(context);
}

String imgstring = '';

imageadd(XFile? pickImage) async {
  if (pickImage == null) {
    return;
  } else {
    final bayts = File(pickImage.path).readAsBytesSync();
    imgstring = base64Encode(bayts);
  }
}
