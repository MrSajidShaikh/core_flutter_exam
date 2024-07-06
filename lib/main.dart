import 'package:flutter/material.dart';

import 'components/screens/edit_page.dart';
import 'components/screens/fill_details.dart';
import 'components/screens/home_screen.dart';
import 'components/screens/show_Data.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const Homepage(),
        '/fillDetails' : (context) => const Filldetails(),
        '/editPage' : (context) => const EditPage(),
        '/showData' : (context) => const showData(),
      },
    );
  }
}
