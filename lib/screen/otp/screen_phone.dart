import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screen_otp.dart';

class ScreenPhone extends StatelessWidget {
  const ScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Phone verfication'),
            TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'enter phone no',
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                      verificationCompleted: (phoneAuthCredential) {},
                      verificationFailed: (error) {},
                      codeSent: (verificationId, forceResendingToken) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenOtp(
                            verficationId: verificationId,
                          ),
                        ));
                      },
                      codeAutoRetrievalTimeout: (verificationId) {},
                      phoneNumber: phoneController.text);
                },
                child: Text('Verfiy pno'))
          ],
        ),
      ),
    );
  }
}
