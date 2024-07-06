
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


Color barColor = const Color(0xFF2196F3);
Color bgColor = const Color(0xFFFFFFFF);
TextEditingController txtName = TextEditingController();
TextEditingController txtGrId = TextEditingController();
TextEditingController txtStd = TextEditingController();
File? fileImage;
GlobalKey<FormState> formKey = GlobalKey();
List studentList = [];

ImagePicker imgPicker = ImagePicker();
