import 'package:database_project/view/Screen_homepage/db/db%20model/data_model.dart';
import 'package:flutter/cupertino.dart';

class StudentModelProvider with ChangeNotifier{
 List<StudentModel>studentList=[];
void addAllStudent({required data}){
  studentList.clear();
  studentList.addAll(data);
  notifyListeners();

}



}