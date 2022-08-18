import 'package:database_project/view/Screen_homepage/addstudentwidget.dart';
import 'package:database_project/view/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/view/Screen_homepage/db/db%20model/data_model.dart';
import 'package:flutter/material.dart';

class AddStudentProviderModel with ChangeNotifier{
 Future<void> onAddStudentDetails(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _name = AddStudentWeidget.namecontroller.text.trim();
    // ignore: no_leading_underscores_for_local_identifiers
    final _number = AddStudentWeidget.numbercontroller.text.trim();
    // ignore: no_leading_underscores_for_local_identifiers
    final _className = AddStudentWeidget.classcontroller.text.trim();
    // ignore: no_leading_underscores_for_local_identifiers
    final _email = AddStudentWeidget.emailcontroller.text.trim();
   
    if (_name.isEmpty ||
        _number.isEmpty ||
        _className.isEmpty ||
        _email.isEmpty) {
      const Text('Required Field is Empty');
    } else {
      final StudentModel studentDb = StudentModel(
          name: _name,
          classname: _className,
          number: _number,
          email: _email,
          image:AddStudentWeidget.newimage);
      addStudent(studentDb);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Added'),
          backgroundColor: Color.fromARGB(255, 3, 141, 8)));
      AddStudentWeidget.namecontroller.clear();
      AddStudentWeidget.numbercontroller.clear();
      AddStudentWeidget.classcontroller.clear();
      AddStudentWeidget.emailcontroller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
     notifyListeners();
    }
   
  }
}


