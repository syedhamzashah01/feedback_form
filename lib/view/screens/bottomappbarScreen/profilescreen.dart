import 'package:feedback_form/constant.dart';
import 'package:feedback_form/database/database_helper.dart';
import 'package:feedback_form/view/formScreens/UserInputScreen.dart';
import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> userData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final dbHelper = DatabaseHelper();
    var data = await dbHelper.getAllUsers(); // Get the list of users

    setState(() {
      if (data.isNotEmpty) {
        userData = data[0].toMap(); // Use the first user
      } else {
        userData = {}; // No users found
      }
      isLoading = false;
    });
  }

  void _navigateToUserInput() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserInputScreen()),
    );

    if (result == true) {
      _loadUserData(); // Reload user data when returning
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          },
          icon: Icon(Icons.arrow_left, size: 35,color: Colors.white,),
        ),
        backgroundColor: Color(0xff336699),
        title: Text("Profile",style: TextStyle(color: Colors.white),),

      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userData.isEmpty
          ? Center(child: Text("No user data found"))
          : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/as.png',
                  filterQuality: FilterQuality.high,
                  height: 200,
                ),
                Card(
                  child: ListTile(
                    title: Text("Name"),
                    subtitle: Text(userData['name'] ?? 'Unknown'),
                  ),
                ),
                Card(
                  color: Color(0xff336699),
                  child: ListTile(
                    title: Text(
                      "Age",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      userData['age']?.toString() ?? 'Unknown',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      "Email",
                      style: H2,
                    ),
                    subtitle: Text(
                      userData['email'] ?? 'Unknown',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xff336699),
                  child: ListTile(
                    title: Text(
                      "CNIC Number",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      userData['cnic'] ?? 'Unknown',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Department"),
                    subtitle: Text(userData['department'] ?? 'Unknown'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
