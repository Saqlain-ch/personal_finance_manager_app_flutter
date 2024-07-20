import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/autho/UI_Componants/mybutton.dart';
import 'package:myapp/autho/UI_Componants/text_fields.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

//controllars for username and password text input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: loginBox(context),
    ));
  }
}

// Suggested code may be subject to a license. Learn more: ~LicenseLog:2857421255.
Widget loginBox(context) {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  //sign user in
  void signUserIn() {
    print("signin clicked");
  }

  return Center(
    child: ListView(
      children: [
        // logo
        // Image.asset('assets/medialogo.png',
        //     width: 100, height: 100, fit: BoxFit.cover),
        SizedBox(
          height: 50,
        ),
        Icon(CupertinoIcons.waveform_circle_fill, size: 100),
        // welcome back lets login test
        SizedBox(
          height: 50,
        ),
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20,
        ),
        // Inputs fileds for username and password
        myTextInputField(
            controllar: usernameController,
            labelText: 'Username / Email',
            obscureText: false),
        SizedBox(
          height: 10,
        ),
        myTextInputField(
            controllar: passwordController,
            labelText: 'Password',
            obscureText: true),

        // forgot password text in left side
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Forgot Password?",
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).primaryColor)),
          ],
        ),

        // login big button taking 100 space
        SizedBox(
          height: 15,
        ),
        mybutton(onTap: signUserIn, label: "Sign In"),

        // or - text
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Or",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),

        //continue with google big button with logo (logo url https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA)
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:1209276552.
        SizedBox(
          height: 15,
        ),
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:4284852500.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1291972055.
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:4118825360.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2223324319.
        ElevatedButton.icon(
          onPressed: () {},
          icon: Image.network(
            "https://lh3.googleusercontent.com/COxitqgJr1sJnIDe8-jiKhxDx1FrYbtRHKJ9z_hELisAlapwE9LUPh6fcXIfb5vwpbMl4xl9H9TRFPc5NOO8Sb3VSgIBrfRYvW6cUA",
            width: 30,
            height: 30,
          ),
          label: Text("Continue with Google", style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),

        // don't have an account? register
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            Text(
              " Register",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ],
    ),
  );
}
