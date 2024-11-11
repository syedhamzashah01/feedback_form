import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  String name = "John Doe";
  String email = "john.doe@example.com";
  String phone = "123-456-7890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: "Name"),
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                initialValue: email,
                decoration: InputDecoration(labelText: "Email"),
                onSaved: (value) {
                  email = value!;
                },
              ),
              TextFormField(
                initialValue: phone,
                decoration: InputDecoration(labelText: "Phone"),
                onSaved: (value) {
                  phone = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Here, you can update the profile in local storage or send it to an API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile Updated')),
      );
    }
  }
}
