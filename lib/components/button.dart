import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  Button({super.key, required this.title, required this.onTap , });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff336699),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
