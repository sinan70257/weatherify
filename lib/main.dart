import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherify/view/home_screen.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

// ignore: camel_case_types
class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        title: "weatherify");
  }
}
