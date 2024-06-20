import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/students_list.dart';
import 'StudentListScreen.dart';

ImagePicker imagePicker = ImagePicker();
File? fileImage;
TextEditingController txtname = TextEditingController();
TextEditingController txtgrid = TextEditingController();
TextEditingController txtstandard = TextEditingController();

class IdCard extends StatefulWidget {
  const IdCard({super.key});

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {
  List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Registration Form',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentListScreen(students: students, newStudent: null,),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 55,
                  backgroundImage: (fileImage != null) ? FileImage(fileImage!) : null,
                  child: (fileImage != null)
                      ? null
                      : Image.asset('assets/images/Dp.png'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () async {
                        XFile? xfile = await imagePicker.pickImage(source: ImageSource.camera);
                        setState(() {
                          fileImage = File(xfile!.path);
                        });
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () async {
                        XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
                        setState(() {
                          fileImage = File(xfile!.path);
                        });
                      },
                      icon: const Icon(
                        Icons.image,
                        size: 30,
                        color: Colors.blue,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                child: TextFormField(
                  controller: txtname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Value required';
                    }
                    if (RegExp(r'\d').hasMatch(value)) {
                      return 'Enter Only Text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text(
                      'Name',
                      style: TextStyle(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2, color: Colors.blue)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                child: TextFormField(
                  controller: txtgrid,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Value required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text(
                      'Gr Id',
                      style: TextStyle(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2, color: Colors.blue)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                child: TextFormField(
                  controller: txtstandard,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Value required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text(
                      'Standard',
                      style: TextStyle(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 2, color: Colors.blue)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      bool res = formkey.currentState!.validate();
                      if (res) {
                        String name = txtname.text;
                        String grId = txtgrid.text;
                        String standard = txtstandard.text;
                        Student newStudent = Student(name: name, grId: grId, standard: standard, image: fileImage);

                        setState(() {
                          students.add(newStudent);
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentListScreen(
                              students: students, newStudent: null,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Enter valid value!'),
                            action: SnackBarAction(
                              label: 'Retry',
                              onPressed: () {
                                formkey.currentState!.reset();
                              },
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
