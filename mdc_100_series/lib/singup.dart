import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 30.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Username';
                  }
                  int numOfChars = 0;
                  int numOfInts = 0;
                  for (int i = 0; i < value.length; i++) {
                    int char = value.codeUnitAt(i);
                    if ((char >= 65 && char <= 90) ||
                        ((char >= 97 && char <= 122))) {
                      numOfChars++;
                    } else if (char >= 48 && char <= 57) {
                      numOfInts++;
                    }
                  }
                  if (numOfInts < 3 || numOfChars < 3) {
                    return 'Username is invalid';
                  }
                  return null;
                },
                controller: _usernameController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
                  }
                  password = value;
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Confirm Password';
                  } else if (value != password) {
                    return 'Confirm Password doesn\'t match Password';
                  }
                  return null;
                },
                controller: _confirmpasswordController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Email Address';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Email Address',
                ),
              ),
              const SizedBox(height: 12.0),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
