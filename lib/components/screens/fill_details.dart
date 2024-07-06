import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/global.dart';
import '../../utils/students_list.dart';
import 'home_screen.dart';

class Filldetails extends StatefulWidget {
  const Filldetails({super.key});

  @override
  State<Filldetails> createState() => _FilldetailsState();
}

class _FilldetailsState extends State<Filldetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,color: barColor),
          centerTitle: true,
          backgroundColor: barColor,
          title: const Text(
            'Fill Details',
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
                            return SizedBox(
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
                      backgroundColor: Colors.blue.shade300,
                      // foregroundImage: const AssetImage('assets/images/Dp.png'),
                      radius: 70,
                      backgroundImage:
                      (fileImage != null) ? FileImage(fileImage!) : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                      return null;
                    },
                    controller: txtName,
                    decoration: InputDecoration(
                      label: const Text('Student Name',style: TextStyle(color: Colors.black)),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                      return null;
                    },
                    controller: txtGrId,
                    decoration: InputDecoration(
                      label: const Text('GR ID',style: TextStyle(color: Colors.black)),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field Must be Required';
                      }
                      return null;
                    },
                    controller: txtStd,
                    decoration: InputDecoration(
                      label: const Text('Standard',style: TextStyle(color: Colors.black)),
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
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() && fileImage != null) {
                          Navigator.of(context).pushNamed('/');
                          studentList.add(StudentModel(
                            name: txtName.text,
                            grid: txtGrId.text,
                            std: txtStd.text,
                            file: fileImage,
                          ));
                        }
                        if(fileImage == null){
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Photo is Required!')));
                          });
                        }
                      },
                      child: const InkWell(
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.blue, fontSize: 22),
                        ),
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
