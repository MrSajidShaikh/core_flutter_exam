import 'dart:io';
import 'package:core_flutter_exam/components/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/students_list.dart';

class StudentListScreen extends StatefulWidget {
  final List<Student> students;

  StudentListScreen({Key? key, required this.students, required newStudent})
      : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: widget.students.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: widget.students[index].image != null
                  ? FileImage(widget.students[index].image!)
                  : const AssetImage('assets/images/Dp.png') as ImageProvider,
            ),
            title: Text(widget.students[index].name),
            subtitle: Text(
                'Gr Id: ${widget.students[index].grId}\nStandard: ${widget.students[index].standard}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  widget.students.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const IdCard()
            ),
          );
        },
      ),
    );
  }
}
