import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/global.dart';
import '../../utils/students_list.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back, color: Colors.blue),
          centerTitle: true,
          backgroundColor: barColor,
          title: const Text(
            'Edit Student Details',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          toolbarHeight: 65,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () async {
                                        XFile? xFileImage =
                                        await imgPicker.pickImage(
                                            source: ImageSource.gallery);
                                        fileImage = File(xFileImage!.path);
                                        setState(() {});
                                      },
                                      child: const Text(
                                        'Gallery',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        XFile? xFileImage =
                                        await imgPicker.pickImage(
                                            source: ImageSource.camera);
                                        fileImage = File(xFileImage!.path);
                                        setState(() {});
                                      },
                                      child: const Text(
                                        'Camera',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20),
                                      )),
                                ],
                              ),
                            );
                          });
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                      (fileImage != null) ? FileImage(fileImage!) : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //todo ---------------------> name
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                    },
                    controller: txtName,
                    decoration: InputDecoration(
                      label: const Text('Student Name',
                          style: TextStyle(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                      return null;
                    },
                    controller: txtGrId,
                    decoration: InputDecoration(
                      label:
                      const Text('GR ID', style: TextStyle(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          )),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                    },
                    controller: txtStd,
                    decoration: InputDecoration(
                      label: const Text('Standard',
                          style: TextStyle(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            fileImage != null) {
                          studentList[selectedIndex].name = txtName.text;
                          studentList[selectedIndex].grid = txtGrId.text;
                          studentList[selectedIndex].std = txtStd.text;
                          Navigator.of(context).pushNamed('/');
                        }
                        if (fileImage == null) {
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Photo is Required!')));
                          });
                        }
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.blue, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}