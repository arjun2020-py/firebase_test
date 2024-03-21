import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  TextEditingController emailCtr = TextEditingController(),
      passwrodCtr = TextEditingController();
  loginAuth(String emailText, String passwrodText) async {
    if (emailCtr.text.isNotEmpty && passwrodCtr.text.isNotEmpty) {
      
    }
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailText, password: passwrodText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailCtr,
              decoration: InputDecoration(
                  hintText: 'enter username', border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: passwrodCtr,
              decoration: InputDecoration(
                  hintText: 'enter passwrod', border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  loginAuth(emailCtr.text, passwrodCtr.text);
                  emailCtr.clear();
                  passwrodCtr.clear();
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
