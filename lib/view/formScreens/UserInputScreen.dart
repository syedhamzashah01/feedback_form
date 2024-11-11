import 'package:feedback_form/components/button.dart';
import 'package:feedback_form/constant.dart';
import 'package:feedback_form/database/database_helper.dart';
import 'package:feedback_form/view/formScreens/QuestionScreen.dart';
import 'package:feedback_form/view/screens/bottomappbarScreen/notifecation.dart';
import 'package:feedback_form/view/screens/bottomappbarScreen/profilescreen.dart';
import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:feedback_form/database/model/user.dart';

class UserInputScreen extends StatefulWidget {
  final int? userId; // Optional userId for updating existing user

  UserInputScreen({this.userId}); // Constructor

  @override
  _UserInputScreenState createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cnicController = TextEditingController();
  String _selectedDepartment = 'Computer Science';
  final _formKey = GlobalKey<FormState>();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    if (widget.userId != null) {
      _loadUserData(widget.userId!); // Load existing user data
    }
  }

  Future<void> _loadUserData(int userId) async {
    var data = await _databaseHelper.getUserData(userId);
    if (data != null) {
      _nameController.text = data['name'];
      _ageController.text = data['age'].toString();
      _emailController.text = data['email'];
      _passwordController.text = data['password'];
      _cnicController.text = data['cnic'];
      _selectedDepartment = data['department'];
    }
  }

  Future<void> _saveDataToDatabase() async {
    if (_formKey.currentState!.validate()) {
      final user = User(
        id: widget.userId, // Pass user ID if updating
        name: _nameController.text,
        age: int.parse(_ageController.text),
        email: _emailController.text,
        password: _passwordController.text,
        cnic: _cnicController.text,
        department: _selectedDepartment,
      );

      try {
        if (widget.userId == null) {
          // Insert new user if no userId provided
          await _databaseHelper.insertUser(user);
        } else {
          // Update existing user
          await _databaseHelper.updateUser(user);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                QuestionScreen(department: _selectedDepartment),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
     appBar: AppBar(
       leading: IconButton(
         onPressed: (){

         },
         icon: Icon(Icons.arrow_left, color: Colors.white,size: 35,),
       ),
       backgroundColor: Color(0xff336699),
     ),
        bottomNavigationBar: BottomAppBar(
          height: 55,
          color: Color(0xff336699),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.home, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        
        body: Container(
          
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    height: 40,
                    child: Center(
                      child: Text('Enter your information below',
                          style: H1),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(labelText: 'Full Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _ageController,
                            decoration: InputDecoration(labelText: 'Age'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _cnicController,
                            decoration: InputDecoration(labelText: 'CNIC Number'),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your CNIC number';
                              }
                              return null;
                            },
                          ),
                          DropdownButton<String>(
                            isExpanded: true,
                            value: _selectedDepartment,
                            items: <String>[
                              'Computer Science',
                              'Information Technology',
                              'Urdu',
                              'Economics',
                              'English',
                              'Mathematics'
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _selectedDepartment = newValue!;
                              });
                            },
                          ),
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Button(
                              title: "Next",
                              onTap: _saveDataToDatabase,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
