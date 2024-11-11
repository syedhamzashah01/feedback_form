import 'package:feedback_form/constant.dart';
import 'package:feedback_form/view/screens/bottomappbarScreen/profilescreen.dart';
import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                      color: Colors.white,
                      size: 30,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()));
                      });
                    },
                    child: Icon(
                      Icons.person,
                      color: _change ? Colors.white: Colors.grey,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Container(
              height: 70,
              width: double.infinity,
              child:Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 30,

                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(child: Icon(Icons.more_vert,color: Colors.black,))
                  ],
                ),
              ),),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/notimage/a.jpg'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                              TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                              text: 'Syed Hamza Shah\n',
                              style: H1
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/notimage/b.jpg'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                              TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                              text: 'Gohar Rahman\n',
                              style: H1
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                              TextSpan(style: TextStyle(color: Colors.black),
                                  children: [
                            TextSpan(
                              text: 'Syed\n',
                              style: H1,
                            ),
                            TextSpan(
                                text: 'veryfiy your account',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2014/04/02/17/07/user-307993_960_720.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                              TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                              text: 'Palwasha Khan\n',
                              style: H1,
                            ),
                            TextSpan(
                                text: 'complete your feedback',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://photosdp.com/wp-content/uploads/2024/06/hidden-face-girl-dp-39.jpg'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                              TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                              text: 'Aleena Shah\n',
                              style: H1,
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style:H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWf5jz1L__t9q15gFBGoWmiM_z3JvJ7gX-nQ&s'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                              TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                              text: 'Syeda Khadija\n',
                              style: H1
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWf5jz1L__t9q15gFBGoWmiM_z3JvJ7gX-nQ&s'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                                text: 'Syeda Khadija\n',
                                style: H1
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Syed\n',
                                  style: H1,
                                ),
                                TextSpan(
                                    text: 'veryfiy your account',
                                    style: H2)
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Syed\n',
                                  style: H1,
                                ),
                                TextSpan(
                                    text: 'veryfiy your account',
                                    style: H2)
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Syed\n',
                                  style: H1,
                                ),
                                TextSpan(
                                    text: 'veryfiy your account',
                                    style: H2)
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Syed\n',
                                  style: H1,
                                ),
                                TextSpan(
                                    text: 'veryfiy your account',
                                    style: H2)
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://i0.wp.com/www.repol.copl.ulaval.ca/wp-content/uploads/2019/01/default-user-icon.jpg?ssl=1'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: 'Syed\n',
                                  style: H1,
                                ),
                                TextSpan(
                                    text: 'veryfiy your account',
                                    style: H2)
                              ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWf5jz1L__t9q15gFBGoWmiM_z3JvJ7gX-nQ&s'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                                text: 'Syeda Khadija\n',
                                style: H1
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWf5jz1L__t9q15gFBGoWmiM_z3JvJ7gX-nQ&s'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RichText(
                          text:
                          TextSpan(style: TextStyle(color: Colors.black), children: [
                            TextSpan(
                                text: 'Syeda Khadija\n',
                                style: H1
                            ),
                            TextSpan(
                                text: 'your feedback is successfull',
                                style: H2)
                          ]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
