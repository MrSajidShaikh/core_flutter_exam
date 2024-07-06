import 'dart:io';
import 'package:flutter/material.dart';
import '../../utils/global.dart';
import '../../utils/students_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back, color: barColor),
          centerTitle: true,
          backgroundColor: barColor,
          title: const Text(
            'Home Page',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          toolbarHeight: 65,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
          child: Column(
            children: List.generate(
              studentList.length,
                  (index) => Container(
                height: 100,
                padding: const EdgeInsets.only(left: 4),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFEEEEEE),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: (studentList[index].file != null)
                          ? FileImage(studentList[index].file!)
                          : null,
                    ),
                    SizedBox(
                      width: 260,
                      child: GestureDetector(
                        onTap: () {
                          txtName.text = studentList[index].name;
                          txtGrId.text = studentList[index].grid;
                          txtStd.text = studentList[index].std;
                          fileImage = studentList[index].file;
                          Navigator.of(context).pushNamed('/showData');
                        },
                        child: ListTile(
                          title: Text(
                            studentList[index].name,
                            style: const TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          subtitle: Text(
                            studentList[index].grid,
                            style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          trailing: Text(
                            studentList[index].std,
                            style: const TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              txtName.text = studentList[index].name;
                              txtGrId.text = studentList[index].grid;
                              txtStd.text = studentList[index].std;
                              fileImage = studentList[index].file;
                              selectedIndex = index;
                              Navigator.of(context).pushNamed('/editPage');
                            },
                            child: const Icon(Icons.edit, color: Colors.black)),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                studentList.removeAt(index);
                              });
                            },
                            child: const Icon(Icons.delete, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            txtName = TextEditingController();
            txtGrId = TextEditingController();
            txtStd = TextEditingController();
            fileImage = null;
            Navigator.of(context).pushNamed('/fillDetails');
          },
          backgroundColor: barColor,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
