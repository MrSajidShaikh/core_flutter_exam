import 'package:flutter/material.dart';
import '../../utils/global.dart';

class showData extends StatefulWidget {
  const showData({super.key});

  @override
  State<showData> createState() => _showDataState();
}

class _showDataState extends State<showData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: barColor,
          title: const Text(
            'Students Details',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          toolbarHeight: 65,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      radius: 74,
                      backgroundImage:
                      (fileImage != null) ? FileImage(fileImage!) : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Student Name : ${txtName.text}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Student GRID : ${txtGrId.text}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Student Standard : ${txtStd.text}',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
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
