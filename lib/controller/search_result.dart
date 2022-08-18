import 'package:database_project/controller/student_model.dart';
import 'package:database_project/view/Screen_homepage/db/db%20model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchResultProvider with ChangeNotifier {
  List<StudentModel> temp = [];
  void searchAllStudent(value, context) {
    if (value == null || value.isEmpty) {
      Provider.of<SearchResultProvider>(context, listen: false).temp.addAll(
          Provider.of<StudentModelProvider>(context, listen: false)
              .studentList);
    } else {
      Provider.of<SearchResultProvider>(context, listen: false).temp.clear();
      for (StudentModel i
          in Provider.of<StudentModelProvider>(context, listen: false)
              .studentList) {
        if (i.name.toLowerCase().contains(value.toLowerCase())) {
          Provider.of<SearchResultProvider>(context, listen: false).temp.add(i);
        }
      }
    }

    notifyListeners();
  }
}
