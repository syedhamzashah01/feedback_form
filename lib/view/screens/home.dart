import 'package:feedback_form/components/button.dart';
import 'package:feedback_form/view/formScreens/UserInputScreen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                // color: Colors.black54,
                image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/as.png',
                    ))),
          ),
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Button(

                title: "Next",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserInputScreen()));
                }),
          )
        ],
      ),
    );
  }
}
