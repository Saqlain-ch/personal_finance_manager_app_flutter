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
      child: Container(
        child: Text("Hello"),
      ),
    ));
  }
}
