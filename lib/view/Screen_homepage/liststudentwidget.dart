// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:database_project/controller/student_model.dart';
import 'package:database_project/view/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/view/Screen_homepage/show_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);



  @override
  void initState() {
    initState();
  }

  @override
  Widget build(BuildContext context) {
    
    getAllStudents(context);
    return Consumer<StudentModelProvider>(builder:(context, value,child){

        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = value.studentList[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                backgroundImage:
                    MemoryImage(const Base64Decoder().convert(data.image)),
                radius: 100,
              ),
              title: Text(data.name),
              subtitle:const Text('Show more details'),
              trailing: IconButton(
                onPressed: () {
                  deleteStudent(context,index);
                 
                },
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ShowScreen(data: data, index: index)));
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: value.studentList.length,
        );
      
      }
    );
  }
}
