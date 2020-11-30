import 'package:firebase_auth/firebase_auth.dart';
import 'package:gberaadelivery/constants.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';
import 'package:gberaadelivery/widgets/input_text_box.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _success;
  String _userEmail;
  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/login.png'),
                Text(
                  'Sign Up',
                  style: kMainHeading,
                ),
                SizedBox(
                  height: maxSize.height * 0.03,
                ),
                /*InputTextBox(
                  labeltext: 'Email',
                  controller: _emailController,
                ),**/
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: maxSize.height * 0.03,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: maxSize.height * 0.03,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: maxSize.height * 0.07,
                ),
                /*CustomButton(
                  maxSize: maxSize,
                  bheight: 0.07,
                  bwidth: 0.7,
                  buttonText: 'Signup',
                  pageRoute: '/homescreen',
                  color: kMainColor,
                ),**/
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                      color: kMainColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400],
                          offset: Offset(6.0, 6.0),
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6.0, -6.0),
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _register();
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        backgroundColor: kMainColor,
                        decorationColor: kMainColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(_success == null
                      ? ''
                      : (_success
                          ? 'Successfully registered ' + _userEmail
                          : 'Registration failed')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
