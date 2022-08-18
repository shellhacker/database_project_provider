import 'package:database_project/controller/add_student.dart';
import 'package:database_project/controller/bottombar.dart';
import 'package:database_project/controller/search_result.dart';
import 'package:database_project/controller/student_model.dart';
import 'package:database_project/view/Screen_homepage/db/db%20model/data_model.dart';
import 'package:database_project/view/Screen_homepage/home_page.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context)=>AddStudentProviderModel()),
      ChangeNotifierProvider(create: (context)=>BottomNavigationBarProvider()),
       ChangeNotifierProvider(create: (context)=>StudentModelProvider()),
       ChangeNotifierProvider(create: (context)=>SearchResultProvider()),
      ],
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink),
        home:  const HomePage(),
      ),
    );
  }
}
