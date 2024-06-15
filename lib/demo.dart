 import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample/firebase_options.dart';
import 'package:sample/signu_page.dart';
import 'package:sample/usersmodel.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SigUpPage(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  var data;
  var res;

  void sample() async{
     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
     final data =usersFromJson(response.body);
     print(data[8].company.catchPhrase);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text("hello"),
           ElevatedButton(onPressed: (){
        sample();
           }, child: Text("Getdata")),
          ],
        ),
      ),
    );
  }
}