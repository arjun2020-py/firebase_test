import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home_screen.dart';

class ScreenOtp extends StatefulWidget {
  ScreenOtp({super.key, required this.verficationId});
  String verficationId;
  @override
  State<ScreenOtp> createState() => _ScreenOtpState();
}

class _ScreenOtpState extends State<ScreenOtp> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Enter otp'),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'enter otp',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verficationId,
                            smsCode: otpController.text);

                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenHome(),
                      ));
                    });
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Text('Verfiy O'))
          ],
        ),
      ),
    );
  }
}
