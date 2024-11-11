import 'package:feedback_form/view/screens/bottomappbarScreen/notifecation.dart';
import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _change = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            height: 55,
            color: Color(0xff336699),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _change =! _change;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      });
                    },
                    child: Icon(
                      Icons.home,
                      color: _change? Colors.white : Colors.grey,
                      size: 30,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _change =! _change;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => NotificationScreen()));
                      });
                    },
                    child: Icon(
                      Icons.notifications,
                      color: _change ? Colors.white: Colors.grey,
                      size: 30,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AccountScreen()));
                      });
                    },
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [

            ],
          ),
        )
    );
  }
}
