import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: loginBox(),
    ));
  }
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2857421255.
Widget loginBox() {
  return Column(
    children: [
      // logo
      Image.asset('assets/media/logo.png',
          width: 100, height: 100, fit: BoxFit.cover),

      // welcome back lets login test

      // Inputs fileds for username and password

      // forgot password text

      // login big button taking 100 space

      // or - text

      //continue with google bug button

      // don't have an account? register
    ],
  );
}
