import 'dart:convert';
import 'package:database_project/view/Screen_homepage/addstudentwidget.dart';
import 'package:database_project/view/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/view/Screen_homepage/db/db%20model/data_model.dart';
import 'package:database_project/view/Screen_homepage/liststudentwidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditScreen extends StatelessWidget {
  StudentModel data;
  int? index;
  EditScreen({Key? key, required this.data, required this.index})
      : super(key: key);

  final _namecontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _classcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _namecontroller.text = data.name.toString();
    _classcontroller.text = data.classname.toString();
    _numbercontroller.text = data.number.toString();
    _emailcontroller.text = data.email.toString();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 108,
                child: CircleAvatar(
                  backgroundImage: MemoryImage(
                      const Base64Decoder().convert(data.image.toString())),
                  radius: 100,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.image),
                label: const Text('Upload Image'),
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _numbercontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _classcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    onAddStudentDetails(context);
                    AddStudentWeidget();

                     Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save Data')),
            ],
          ),
        ]),
      ),
    );
  }

  onAddStudentDetails(BuildContext context) {
    final name = _namecontroller.text;
    final number = _numbercontroller.text;
    final className = _classcontroller.text;
    final email = _emailcontroller.text;
    const newimage = '';

    if (name.isEmpty ||
        number.isEmpty ||
        className.isEmpty ||
        email.isEmpty) {
      return const Text('Required Field is Empty');
    } else {
      final editedstudent = StudentModel(
          name: name,
          number: number,
          classname: className,
          email: email,
          image: newimage);

      editStudent(context: context, data: editedstudent, index: index);
      getAllStudents(context);
      

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Updated'),
          backgroundColor: Color.fromARGB(255, 3, 141, 8)));
      _namecontroller.clear();
      _numbercontroller.clear();
      _classcontroller.clear();
      _emailcontroller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      const ListStudentWidget();
    }
  }
}
