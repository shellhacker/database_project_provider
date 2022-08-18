import 'package:database_project/view/Screen_homepage/addstudentwidget.dart';
import 'package:database_project/view/Screen_homepage/liststudentwidget.dart';
import 'package:database_project/view/Screen_homepage/search_screen.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigationBarProvider with ChangeNotifier{
  int currentSelectedIndex = 0;

 static final pages = [
    AddStudentWeidget(),
    ScreenSearch(),
    const ListStudentWidget(),
  ];
 void changeBottomBar(newindex){
  currentSelectedIndex=newindex;
  notifyListeners();


  }




}