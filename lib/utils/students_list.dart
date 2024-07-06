import 'dart:io';

class Student {
  final String name;
  final String grId;
  final String standard;
  final File? image;

  Student({required this.name, required this.grId, required this.standard, this.image});
}


// List<Student> students = [
//   Student(name: "John Doe", grId: "GR123456", standard: 8),
//   Student(name: "Jane Smith", grId: "GR123457", standard: 7),
//   Student(name: "Robert Brown", grId: "GR123458", standard: 9),
//   Student(name: "Emily Davis", grId: "GR123459", standard: 8),
//   Student(name: "Michael Johnson", grId: "GR123460", standard: 10),
//   Student(name: "Sarah Wilson", grId: "GR123461", standard: 7),
//   Student(name: "William Martinez", grId: "GR123462", standard: 9),
//   Student(name: "Olivia Anderson", grId: "GR123463", standard: 8),
//   Student(name: "James Taylor", grId: "GR123464", standard: 10),
//   Student(name: "Sophia Moore", grId: "GR123465", standard: 7),
//   Student(name: "Benjamin White", grId: "GR123466", standard: 9),
//   Student(name: "Emma Harris", grId: "GR123467", standard: 8),
//   Student(name: "Lucas Clark", grId: "GR123468", standard: 10),
//   Student(name: "Mia Rodriguez", grId: "GR123469", standard: 7),
//   Student(name: "Mason Lewis", grId: "GR123470", standard: 9),
// ];
String? GrId;
String? name;
int selectedIndex = 0;
String? Standard;

class StudentModel {
  String? name, grid, std;
  File? file;

  StudentModel({this.name, this.grid, this.std, this.file});
}
