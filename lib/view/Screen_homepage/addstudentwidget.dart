import 'dart:convert';
import 'dart:io';

import 'package:database_project/controller/add_student.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';


class AddStudentWeidget extends StatelessWidget {
 AddStudentWeidget({Key? key}) : super(key: key);

  

 static final formkey = GlobalKey<FormState>();
 static final namecontroller = TextEditingController();

  static final numbercontroller = TextEditingController();

  static final classcontroller = TextEditingController();

  static final emailcontroller = TextEditingController();

  File? imagefile;
  String imagestring = '';
static  String newimage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(newimage)),
                  radius: 45,
                ),
                TextButton.icon(
                  onPressed: () {
                    showBottomSheet(context);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Upload Image'),
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: namecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: numbercontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: classcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Domain',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Domain Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email Id'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Id Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {}
                      Provider.of<AddStudentProviderModel>(context,listen: false).onAddStudentDetails(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Students')),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx1) {
        return Container(
          height: 100,
          width: double.infinity,
          color: Colors.pink,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text(
                'choose your profile photo',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      takePic(ImageSource.camera);
                    },
                    icon: const Icon(
                      Icons.camera_front_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      takePic(ImageSource.gallery);
                    },
                    icon: const Icon(
                      Icons.image_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ]),
          ),
        );
      },
    );
  }

  

  takePic(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    final bytes = File(image!.path).readAsBytesSync();
    imagestring = base64Encode(bytes);
    // setState(() {
      newimage = imagestring;
    // });
  }

}