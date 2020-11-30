import 'package:firebase_auth/firebase_auth.dart';
import 'package:gberaadelivery/constants.dart';
import 'package:gberaadelivery/widgets/custom_button.dart';
import 'package:gberaadelivery/widgets/input_text_box.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  'Deliver Everything',
                  style: kMainHeading,
                ),
                SizedBox(
                  height: maxSize.height * 0.03,
                ),
                /*InputTextBox(
                  labeltext: 'Email',
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
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a valid password';
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
                  buttonText: 'Login',
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
                        _signInWithEmailAndPassword();
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        backgroundColor: kMainColor,
                        decorationColor: kMainColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account ?  ',
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign up Now!',
                            style: TextStyle(
                              color: Color(0xFFFBAA29),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    final User user = (await _auth.signInWithEmailAndPassword(
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
        _success = false;
      });
    }
  }
}
