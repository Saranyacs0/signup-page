import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({super.key});

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailcontroller,
          ),
          TextField(
            controller: passwordcontroller,
          ),
          ElevatedButton(onPressed: () async{
          var user = await FirebaseAuth.instance.
          createUserWithEmailAndPassword(
            email: emailcontroller.text,
             password: passwordcontroller.text);
          }, child: Text("Login"))
        ],
      ),
    );
  }
}