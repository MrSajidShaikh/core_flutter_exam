import 'dart:io';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String grId;
  final String standard;
  final File? image;

  DetailPage(
      {required this.name,
      required this.grId,
      required this.standard,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Detail Page',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image != null)
              Center(
                child: CircleAvatar(
                  backgroundImage: FileImage(image!),
                  radius: 55,
                ),
              ),
            const SizedBox(height: 20),
            Text('Name: $name', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('GR ID: $grId', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Standard: $standard', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
