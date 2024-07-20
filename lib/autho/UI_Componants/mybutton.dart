import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final Function()? onTap;
  final String label;
  const mybutton({super.key, this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "${label}",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
